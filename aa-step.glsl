/**
* Inspired from  glsl-aastep module:
* npm i -S glsl-aastep
*/
// #pragma glslify: aastep = require(glsl-aastep)

float aastep(float threshold, float value) {
    float afwidth = length(vec2(dFdx(value), dFdy(value))) * 0.70710678118654757;
    return smoothstep(threshold - afwidth, threshold + afwidth, value);
}

float aaEdge(vec2 uv, float thresh) {
    vec2 st = abs((uv - 0.5) * 2.0);
    float border = aastep(0.5, smoothstep(1.0, thresh, length(st.x))) *
    aastep(0.5, smoothstep(1.0, thresh, length(st.y)));
    return border;
}

#pragma glslify:export(aaEdge)
#pragma glslify:export(aastep)