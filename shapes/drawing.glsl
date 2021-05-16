#pragma glslify:aastep = require(./lib/gozer-utils/glsl/aa-step.glsl)

/* Color palette */
#define BLACK           vec3(0.0, 0.0, 0.0)
#define WHITE           vec3(1.0, 1.0, 1.0)
#define RED             vec3(1.0, 0.0, 0.0)
#define GREEN           vec3(0.0, 1.0, 0.0)
#define BLUE            vec3(0.0, 0.0, 1.0)
#define YELLOW          vec3(1.0, 1.0, 0.0)
#define CYAN            vec3(0.0, 1.0, 1.0)
#define MAGENTA         vec3(1.0, 0.0, 1.0)
#define ORANGE          vec3(1.0, 0.5, 0.0)
#define PURPLE          vec3(1.0, 0.0, 0.5)
#define LIME            vec3(0.5, 1.0, 0.0)
#define ACQUA           vec3(0.0, 1.0, 0.5)
#define VIOLET          vec3(0.5, 0.0, 1.0)
#define AZUR            vec3(0.0, 0.5, 1.0)

/* Signed distance drawing methods */
float fill(in float d) { return 1.0 - aastep(0.0, d); }
float stroke(in float d, in float t) { return (1.0 - aastep(t, abs(d))); }

vec3 draw(in sampler2D t, in vec2 pos, in vec2 w) { vec2 s = w / 1.0; s.x *= -1.0; return texture2D(t, pos / s + 0.5).rgb; }

/* Field Adapted from https://www.shadertoy.com/view/XsyGRW */
vec3 field(float d) {
	const vec3 c1 = mix(WHITE, YELLOW, 0.4);
	const vec3 c2 = mix(WHITE, AZUR, 0.7);
	const vec3 c3 = mix(WHITE, ORANGE, 0.9);
	const vec3 c4 = BLACK;
	float d0 = abs(stroke(mod(d + 0.1, 0.2) - 0.1, 0.004));
	float d1 = abs(stroke(mod(d + 0.025, 0.05) - 0.025, 0.004));
	float d2 = abs(stroke(d, 0.004));
	float f = clamp(d * 0.85, 0.0, 1.0);
	vec3 gradient = mix(c1, c2, f);
	gradient = mix(gradient, c4, 1.0 - clamp(1.25 - d * 0.25, 0.0, 1.0));
	gradient = mix(gradient, c3, fill(d));
	gradient = mix(gradient, c4, max(d2 * 0.85, max(d0 * 0.25, d1 * 0.06125)) * clamp(1.25 - d, 0.0, 1.0));
	return gradient;
}

#pragma glslify:export(fill)
#pragma glslify:export(stroke)
#pragma glslify:export(draw)
#pragma glslify:export(field)