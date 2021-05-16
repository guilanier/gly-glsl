/* Shape 2D arc */
float sArc(in vec2 p, in float w, in float s, in float e) {    
	float a = distance(p, w * 0.5 * vec2(cos(s), sin(s)));
	float x = -PI;
	p *= mat2(cos(x - s), -sin(x - s), sin(x - s), cos(x - s));
	float b = clamp(atan(p.y, p.x), x, x + e);
	b = distance(p, w * 0.5 * vec2(cos(b), sin(b)));
	return min(a, b) * 2.0;
}

/**
 * create sdf for an arc
 * @param  {vec2} in vec2          p coords to create the sdf
 * @param  {float} in float         w radius of the sdf
 * @param  {float} in float         s offset angle
 * @param  {float} in float         e length of the arc
 * @param  {float} in float         t thickness of the arc
 * @return {float}    sdf value
 */
float arc(in vec2 p, in float w, in float s, in float e, in float t) {
	float d = sArc(p, w, s, e);
	return stroke(d, t);
}

#pragma glslify: export(arc)