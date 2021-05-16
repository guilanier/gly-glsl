float map(float value, float inMin, float inMax, float outMin, float outMax, bool clamped) {
    if (clamped)
        value = min(inMax, max(inMin, value));

    return outMin + (outMax - outMin) * (value - inMin) / (inMax - inMin);
}

// clang-format off
#pragma glslify : export(map)
