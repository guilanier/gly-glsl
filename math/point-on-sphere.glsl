vec3 pointOnSphere(float angle1, float angle2, float radius) {
    vec3 pos = vec3(0.0);

    pos.x = radius * cos(angle1) * sin(angle2);
    pos.y = radius * sin(angle1) * sin(angle2);
    pos.z = radius * cos(angle2);

    return pos;
}

// clang-format off
#pragma glslify: export(pointOnSphere)
