#define S smoothstep

// Adjustable blend factor: 0.0 = only background, 1.0 = full effect
#define effectStrength 0.1

vec4 Line(vec2 uv, float speed, float height, vec3 col) {
    uv.y += S(1., 0., abs(uv.x)) * sin(iTime * speed + uv.x * height) * .2;
    return vec4(S(.06 * S(.2, .9, abs(uv.x)), 0., abs(uv.y) - .004) * col, 1.0) * S(1., .3, abs(uv.x));
}

void mainImage(out vec4 O, in vec2 I) {
    vec2 uv = (I - .5 * iResolution.xy) / iResolution.y;
    O = vec4 (0.);
    for (float i = 0.; i <= 5.; i += 1.) {
        float t = i / 5.;
        O += Line(uv, 1. + t, 4. + t, vec3(.2 + t * .7, .2 + t * .4, 0.3));
    }

    vec2 g = I / iResolution.xy;
    vec4 termColor = texture(iChannel0, g);
    // sample the background color (assuming top-left corner is bg color and it is a solid bg (no gradients))
    vec4 bgColor = texture(iChannel0, vec2(0.001, 0.001));
    // determine if the pixel belongs to text (different from bg)
    float textMask = step(0.1, length(termColor.rgb - bgColor.rgb)); // 1 for text, 0 for bg
    float bgMask = 1.0 - textMask; // inverse mask is bg
    //blend shader with bg color
    vec4 blendedBg = mix(bgColor, O, effectStrength); // Adjust mix factor as needed
    // apply: keep text, blend effect into bg
    O = mix(blendedBg, termColor, textMask);
}
