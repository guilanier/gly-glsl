/* Shape 2D segment */
float sSegment(in vec2 a, in vec2 b) {
    vec2 ba = a - b;
    float d = clamp(dot(a, ba) / dot(ba, ba), 0.0, 1.0);
    return length(a - ba * d) * 2.0;
}
/**
 * create sdf for segment
 * @param  {vec2} in    vec2          a             point A
 * @param  {vec2} in    vec2          b             point B
 * @param  {float} float t             thikness of the segment
 * @return {float}       sdf of the segment
 */
float segment(in vec2 a, in vec2 b, float t) {
    float d = sSegment(a, b);
    return stroke(d, t);
}

#pragma glslify: export(segment)