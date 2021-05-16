float ring(vec2 p, float strokeWidth, float s, float dpr) {
    float scale = 1.0 / s;
    float radius = 0.5;
    vec2 center = vec2(0.5);

    vec2 transformedPosition = (p - center) * scale;
    float sdf = length(transformedPosition);

    // apply stroke width
    // float dx = dFdx(p.x * scale); // keep consistent stroke width 
    float dx = dFdx(p.x * (dpr * 1. / scale)); // scale stroke width according  to scale
    
    float innerRadius = radius - dx * strokeWidth;
    float outerRadius = radius;
    float value = 
        aastep(innerRadius, sdf) * 
        (1. - aastep(outerRadius, sdf));

    return value;
}

/**
 * create sdf for a ring
 * @param  {vec2}  p            coords to create the sdf
 * @param  {float} strokeWidth   stroke width in pixels
 * @param  {float} s             scale of the sdf
 * @param  {float} dpr             pixel ratio of the renderer to adapt derivatives
 * @param  {float} alignStroke   0 = inner; 0.5 = center; 1 = outer
 * @return {float}       sdf value
 */
float ring(vec2 p, float strokeWidth, float s, float dpr, float alignStroke) {
    
    float scale = 1.0 / s;
    float radius = 0.5;
    vec2 center = vec2(0.5);

    vec2 transformedPosition = (p - center) * scale;
    float sdf = length(transformedPosition);
    
    float innerEdge = mix(1.0, 0.0, alignStroke);
    float outerEdge = mix(0.0, 1.0, alignStroke);

    // apply stroke width
    // float dx = dFdx(p.x * scale); // keep consistent stroke width 
    float dx = dFdx(p.x * 1. / scale); // scale stroke width according  to scale
    
    float innerRadius = radius - (dx * strokeWidth) * innerEdge;
    float outerRadius = radius + (dx * strokeWidth) * outerEdge;
    float value = 
        aastep(innerRadius, sdf) * 
        (1. - aastep(outerRadius, sdf));

    return value;
}

#pragma glslify: export(ring)
