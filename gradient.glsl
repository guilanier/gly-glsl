#define PI 3.141592653589793

float gradient(vec2 point) {
    float angleFromPoint = atan(point.x, point.y);
    return (angleFromPoint + PI) / (PI * 2.0);
}

vec3 gradient(vec3 c0, vec3 c1, float pct){
    return mix(c0, c1, pct);
}

// clang-format off
#pragma glslify : export(gradient)
