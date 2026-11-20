
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
      if (!env.AI) {
        throw new Error("Cloudflare AI binding is missing.");
      }

      const body = await request.json();
      const prompt = body.prompt;

      if (typeof prompt !== "string" || !prompt.trim()) {
        return Response.json(
          { error: "Please enter an image prompt." },
          { status: 400, headers: corsHeaders }
        );
      }

      const result = await env.AI.run(
        "@cf/black-forest-labs/flux-1-schnell",
        {
          prompt: prompt.trim()
        }
      );

      if (!result || !result.image) {
        throw new Error("AI did not return an image.");
      }

      const binaryString = atob(result.image);
      const img = Uint8Array.from(
        binaryString,
        (char) => char.charCodeAt(0)
      );

      return new Response(img, {
        headers: {
          ...corsHeaders,
          "Content-Type": "image/jpeg",
          "Cache-Control": "no-store"
        }
      });

    } catch (error) {
      return Response.json(
        {
          error: "Image generation failed.",
          detail: error.message
        },
        { status: 500, headers: corsHeaders }
      );
    }
  }
};
