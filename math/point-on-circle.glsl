vec2 pointOnCircle(float angle, float dist) {
    vec2 pos = vec2(0.0);

    pos.x = sin(angle) * dist;
    pos.y = cos(angle) * dist;

    return pos;
}

// clang-format off
#pragma glslify: export(pointOnCircle)
