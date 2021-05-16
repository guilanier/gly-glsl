float createCircle(vec2 uv, float s) {
    float scale = 1.0 / s;
    vec2 center = vec2(0.5);
    float radius = 0.5;

    vec2 transformedPosition = (uv - center) * scale;
    float sdf = length(transformedPosition);

    float circleRadius = radius;
    float value = aastep(circleRadius, sdf);

    return value;
}

/**
 * create sdf for a circle (suit orthographic camera)
 * @param  {vec2}   uv            coords to create the sdf
 * @param  {float}  radius        radius of the circle in pixels (look at dpr)
 * @param  {float}  s             scale
 * @return {float}       sdf value
 */
float createCircle(vec2 uv, float radius, float s) {
    float scale = 1.0 / s;
    vec2 center = vec2(0.5);

    vec2 transformedPosition = (uv - center) * scale;
    float sdf = length(transformedPosition);

    float dx = dFdx(uv.x * 1.0 / scale);
    float circleRadius = dx * radius;
    float value = aastep(circleRadius, sdf);

    return value;
}

/* Shape 2D circle */
float sCircle(in vec2 p, in float w) {
    return length(p) * 2.0 - w;
}
float circle(in vec2 p, in float w) {
    float d = sCircle(p, w);
    return fill(d);
}
/**
 * create sdf for circle
 * @param  {[type]} in    vec2          p coords to create the sdf
 * @param  {[type]} in    float         w size of the sdf
 * @param  {[type]} float t             t thickness stroke
 * @return {[type]}       sdf value
 */
float circle(in vec2 p, in float w, float t) {
    float d = sCircle(p, w);
    return stroke(d, t);
}

#pragma glslify: export(createCircle)