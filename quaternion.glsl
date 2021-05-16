vec4 quaternion(vec3 axis, float angle) {
    float halfAngle = angle / 2.0;
    vec4 q = vec4(0.0);

    q.x = axis.x * sin(halfAngle);
    q.y = axis.y * sin(halfAngle);
    q.z = axis.z * sin(halfAngle);
    q.w = cos(halfAngle);

    return q;
}

vec4 quaternionMultiply(vec4 q1, vec4 q2) {
    vec4 qr;
    qr.x = (q1.w * q2.x) + (q1.x * q2.w) + (q1.y * q2.z) - (q1.z * q2.y);
    qr.y = (q1.w * q2.y) - (q1.x * q2.z) + (q1.y * q2.w) + (q1.z * q2.x);
    qr.z = (q1.w * q2.z) + (q1.x * q2.y) - (q1.y * q2.x) + (q1.z * q2.w);
    qr.w = (q1.w * q2.w) - (q1.x * q2.x) - (q1.y * q2.y) - (q1.z * q2.z);
    return qr;
}

// clang-format off
#pragma glslify: export(quaternion)
