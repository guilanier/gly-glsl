vec2 UVScale(vec2 st, vec2 scale) {
    st -= 0.5;
    st /= scale;
    st += 0.5;
    return st;
}

vec2 UVScale(vec2 st, vec2 scale, vec2 offset) {
    st -= 0.5;
    st /= scale;
    st += offset;
    st += 0.5;
    return st;
}

// clang-format off
#pragma glslify : export(UVScale)
