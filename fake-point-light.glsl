float fakePointLightIntensity(vec3 point, vec3 normal, vec2 res, float amount) {
    
    vec2 pixel = gl_FragCoord.xy / res.xy;
    
    vec2 lightPos = point.xy / res.xy; // We normalize the light source
    lightPos.y = 1.0 - lightPos.y;
    
    vec3 lightVec = vec3(lightPos.x - pixel.x, lightPos.y - pixel.y, point.z);
    lightVec = normalize(lightVec);
    
    float outgoingIntensity = amount * max(dot(normal, lightVec), 0.0);
    
    return outgoingIntensity;
}

// clang-format off
#pragma glslify : export(fakePointLightIntensity)
