#define CONTAIN 0 // contain (Scales the image as large as possible without cropping or stretching the image.)
#define COVER 1 // cover (Scales the image as large as possible by cropping and without stretching the image )

vec2 UVResize(vec2 uvBase, vec2 res, vec2 resTex, vec2 sc, int sizing) {
    
    vec2 st;
    st.x = (res.x / resTex.x);
    st.y = (res.y / resTex.y);
    
    float r = sizing == COVER ? max(st.x, st.y) : min(st.x, st.y);
    
    vec2 uv = uvBase;
    uv -= vec2(0.5);
    uv *= st;
    uv *= 1.0 / r;
    uv *= 1.0 / sc;
    uv += vec2(0.5);
    
    return uv;
}

#pragma glslify:export(UVResize)
