void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize coordinates (0.0 to 1.0)
    vec2 uv = fragCoord / iResolution.xy;
    
    // Sample the terminal's texture (iChannel0)
    vec3 color = texture(iChannel0, uv).rgb;
    
    // Apply a simple scanline effect: modulate brightness using a sine function
    float scanline = 0.85 + 0.15 * sin(fragCoord.y * 10.0);
    
    // Output the final color with full opacity
    fragColor = vec4(color * scanline, 1.0);
}

