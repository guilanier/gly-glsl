
#define FXAA_REDUCE_MIN (1.0 / 128.0)
#define FXAA_REDUCE_MUL (1.0 / 8.0)
#define FXAA_SPAN_MAX 8.0

vec4 fxaa(sampler2D tex, vec2 resolution) {

    vec3 rgbNW = texture2D(tex, (gl_FragCoord.xy + vec2(-1.0, -1.0)) * resolution).xyz;
    vec3 rgbNE = texture2D(tex, (gl_FragCoord.xy + vec2(1.0, -1.0)) * resolution).xyz;
    vec3 rgbSW = texture2D(tex, (gl_FragCoord.xy + vec2(-1.0, 1.0)) * resolution).xyz;
    vec3 rgbSE = texture2D(tex, (gl_FragCoord.xy + vec2(1.0, 1.0)) * resolution).xyz;
    vec4 rgbaM = texture2D(tex, gl_FragCoord.xy * resolution);
    vec3 rgbM = rgbaM.xyz;
    vec3 luma = vec3(0.299, 0.587, 0.114);

    float lumaNW = dot(rgbNW, luma);
    float lumaNE = dot(rgbNE, luma);
    float lumaSW = dot(rgbSW, luma);
    float lumaSE = dot(rgbSE, luma);
    float lumaM = dot(rgbM, luma);
    float lumaMin = min(lumaM, min(min(lumaNW, lumaNE), min(lumaSW, lumaSE)));
    float lumaMax = max(lumaM, max(max(lumaNW, lumaNE), max(lumaSW, lumaSE)));

    vec2 dir;
    dir.x = -((lumaNW + lumaNE) - (lumaSW + lumaSE));
    dir.y = ((lumaNW + lumaSW) - (lumaNE + lumaSE));

    float dirReduce = max((lumaNW + lumaNE + lumaSW + lumaSE) * (0.25 * FXAA_REDUCE_MUL), FXAA_REDUCE_MIN);

    float rcpDirMin = 1.0 / (min(abs(dir.x), abs(dir.y)) + dirReduce);
    dir = min(vec2(FXAA_SPAN_MAX, FXAA_SPAN_MAX), max(vec2(-FXAA_SPAN_MAX, -FXAA_SPAN_MAX), dir * rcpDirMin)) *
          resolution;
    vec4 rgbA = (1.0 / 2.0) * (texture2D(tex, gl_FragCoord.xy * resolution + dir * (1.0 / 3.0 - 0.5)) +
                               texture2D(tex, gl_FragCoord.xy * resolution + dir * (2.0 / 3.0 - 0.5)));
    vec4 rgbB =
        rgbA * (1.0 / 2.0) + (1.0 / 4.0) * (texture2D(tex, gl_FragCoord.xy * resolution + dir * (0.0 / 3.0 - 0.5)) +
                                            texture2D(tex, gl_FragCoord.xy * resolution + dir * (3.0 / 3.0 - 0.5)));
    float lumaB = dot(rgbB, vec4(luma, 0.0));

    vec4 result = vec4(0.);

    if ((lumaB < lumaMin) || (lumaB > lumaMax)) {
        result = rgbA;

    } else {
        result = rgbB;
    }

    return result;
}

// clang-format off
#pragma glslify: export(fxaa)
