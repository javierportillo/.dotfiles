/*
    "Singularity" by @XorDev

    I'll come back to clean up the code later.
    Feel free to code golf!
    
    
    dean_the_coder: -12
    FabriceNeyret2: -19
*/
void mainImage(out vec4 O, in vec2 F)
{
    float i = 0.0;
    vec2 r = iResolution.xy,
         p = ( F+F - r ) / r.y / .7,
         d = vec2(-1,1), q = 5.*p - d, 
         c = p * mat2(1, 1, d/(.1 + 5./dot(q,q)) ),
         v = c * mat2(cos( log(length(c)) +iTime*.2 + vec4(0,33,11,0))) * 5.;
   
    for(O*=i; i++ < 9.; O += 1. + sin(v.xyyx) )
        v += .7 * sin(v.yx*i+iTime) / i + .5;
        
    i = length( sin(v/.3)*.2 + c*vec2(1,2) ) - 1.;
    O = 1. - exp( -exp( c.x * vec4(.6,-.4,-1,0) ) 
                   /  O
                   / ( 1. + i*i )
                   / ( .5 + 3.5 *exp( .3*c.y - dot(c,c) ) )
                   / ( .03 + abs( length(p)-.7 ) )
             );

  vec2 gv = F / iResolution.xy;
  vec4 termColor = texture(iChannel0, gv);
  // sample the background color (assuming top-left corner is bg color and it is a solid bg (no gradients))
  vec4 bgColor = texture(iChannel0, vec2(0.001, 0.001));
  // determine if the pixel belongs to text (different from bg)
  float textMask = step(0.1, length(termColor.rgb - bgColor.rgb)); // 1 for text, 0 for bg
  float bgMask = 1.0 - textMask; // inverse mask is bg
  //blend shader with bg color
  vec4 blendedBg = mix(bgColor, vec4(O.rgb, 1.0), 0.3); // Adjust mix factor as needed
  // apply: keep text, blend effect into bg
  O = vec4(mix(blendedBg, termColor, textMask).rgb, 1.0);
}

