vec2 UVMirroring(vec2 st, int side) {
    
    vec2 p = st;
    
    p.x = side == 0 &&(p.x > 0.5) ?
    1.0 - p.x : side == 1 && p.x < 0.5 ?
    1.0 - p.x : p.x;
    
    return p;
}
// clang-format off
#pragma glslify:export(UVmirroring)
