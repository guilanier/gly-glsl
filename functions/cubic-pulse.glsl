/**
 * https://www.iquilezles.org/www/articles/functions/functions.htm
 * smoothstep(c-w,c,x)-smoothstep(c,c+w,x)
 * @param  {float} float c             offset
 * @param  {float} float w             size
 * @param  {float} float x             coordinates
 * @return {float}       result
 */
float cubicPulse( float c, float w, float x ){
    x = abs(x - c);
    if( x>w ) return 0.0;
    x /= w;
    return 1.0 - x*x*(3.0-2.0*x);
}

#pragma glslify: export(cubicPulse)