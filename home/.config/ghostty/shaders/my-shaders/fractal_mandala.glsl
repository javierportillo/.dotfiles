/* This animation is the material of my first youtube tutorial about creative 
   coding, which is a video in which I try to introduce programmers to GLSL 
   and to the wonderful world of shaders, while also trying to share my recent 
   passion for this community.
                                       Video URL: https://youtu.be/f4s1h2YETNY
*/

//https://iquilezles.org/articles/palettes/
vec3 palette( float t ) {
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.263,0.416,0.557);

    return a + b*cos( 6.28318*(c*t+d) );
}

//https://www.shadertoy.com/view/mtyGWy
void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);
    
    for (float i = 0.0; i < 4.0; i++) {
        uv = fract(uv * 1.5) - 0.5;

        float d = length(uv) * exp(-length(uv0));

        vec3 col = palette(length(uv0) + i*.4 + iTime*.4);

        d = sin(d*8. + iTime)/8.;
        d = abs(d);

        d = pow(0.01 / d, 1.2);

        finalColor += col * d;
    }
        
    vec2 gv = fragCoord / iResolution.xy;
    vec4 termColor = texture(iChannel0, gv);
    // sample the background color (assuming top-left corner is bg color and it is a solid bg (no gradients))
    vec4 bgColor = texture(iChannel0, vec2(0.001, 0.001));
    // determine if the pixel belongs to text (different from bg)
    float textMask = step(0.1, length(termColor.rgb - bgColor.rgb)); // 1 for text, 0 for bg
    float bgMask = 1.0 - textMask; // inverse mask is bg
    //blend shader with bg color
    vec4 blendedBg = mix(bgColor, vec4(finalColor.rgb, 1.0), 0.02); // Adjust mix factor as needed
    // apply: keep text, blend effect into bg
    fragColor = vec4(mix(blendedBg, termColor, textMask).rgb, 1.0);
}
