float crop(vec2 st, vec2 offs) {
    return step(st.x - offs.x, 1.0) * step(0.0 + offs.x, st.x) * step(st.y, 1.0 - offs.y) * step(0.0 + offs.y, st.y);
}
float crop(vec2 st) {
    return step(st.x, 1.0) * step(0.0, st.x) * step(st.y, 1.0) * step(0.0, st.y);
}
#pragma glslify:export(crop)