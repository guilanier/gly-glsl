float clampNorm(float val, float min, float max) { return clamp((val - min) / (max - min), 0.0, 1.0); }

// clang-format off
#pragma glslify: export(clampNorm)
