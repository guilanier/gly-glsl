mat3 skew2d(in vec2 angle){
    return mat3(
        1.0, tan(angle.x), 0.0,
        tan(angle.y), 1.0, 0.0,
        0.0, 0.0, 1.0
    );
}

// clang-format off
#pragma glslify: export(skew2d)