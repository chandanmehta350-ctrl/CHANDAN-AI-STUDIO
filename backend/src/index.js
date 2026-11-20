import { InferenceClient } from "@huggingface/inference";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type",
};

export default {
  async fetch(request, env) {
    if (request.method === "OPTIONS") {
      return new Response(null, { headers: corsHeaders });
    }

    if (request.method !== "POST") {
      return Response.json(
        { message: "CHANDAN AI STUDIO backend is ready." },
        { headers: corsHeaders }
      );
    }

    try {
      if (!env.HF_TOKEN) {
        throw new Error("Server token is not configured.");
      }

      const body = await request.json();
      const prompt = body.prompt;

      if (typeof prompt !== "string" || !prompt.trim()) {
        return Response.json(
          { error: "Please enter an image prompt." },
          { status: 400, headers: corsHeaders }
        );
      }

      const client = new InferenceClient(env.HF_TOKEN);

      const image = await client.textToImage({
        model: "black-forest-labs/FLUX.1-dev",
        inputs: prompt.trim(),
        provider: "auto",
      });

      return new Response(image, {
        headers: {
          ...corsHeaders,
          "Content-Type": "image/png",
          "Cache-Control": "no-store",
        },
      });
    } catch (error) {
      return Response.json(
        { error: "Image generation failed.", detail: error.message },
        { status: 500, headers: corsHeaders }
      );
    }
  },
};
