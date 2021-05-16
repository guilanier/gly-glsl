mat2 rotate2d(in float angle){
    return mat2(cos(angle),-sin(angle), sin(angle), cos(angle));
}

// clang-format off
#pragma glslify: export(rotate2d)