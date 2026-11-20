const result = await env.AI.run(
  "@cf/black-forest-labs/flux-1-schnell",
  {
    prompt: prompt.trim()
  }
);

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
