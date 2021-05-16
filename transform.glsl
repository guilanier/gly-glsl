// transforms the 'blueprint' geometry with instance attributes
vec3 transform(inout vec3 position, vec3 T, vec4 R, vec3 S) {
    // applies the scale
    position *= S;
    // computes the rotation where R is a (vec4) quaternion
    position += 2.0 * cross(R.xyz, cross(R.xyz, position) + R.w * position);
    // translates the transformed 'blueprint'
    position += T;
    // return the transformed position
    return position;
}

// clang-format off
#pragma glslify: export(transform)
