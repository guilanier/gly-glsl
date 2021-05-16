#pragma glslify:UVResize = require(./lib/gozer-utils/glsl/scale/uv-resize)
#pragma glslify:crop = require(./lib/gozer-utils/glsl/crop.glsl)

/**
 * [getSpriteAtFrame description]
 * @param  {[type]} sampler2D diffuse       [description]
 * @param  {[type]} vec2      uv            [description]
 * @param  {[type]} vec4      frame         [description]
 * @param  {[type]} vec2      size          [description]
 * @return {[type]}           [description]
 */
vec4 getSpriteAtFrame(sampler2D diffuse, vec2 uv, vec4 frame, vec2 size) {
    vec4 f = frame;
    f.xz /= size.x;
    f.yw /= size.y;

    vec2 uvSprite = uv;
    uvSprite.y = (1.0 - f.w) - f.y + (uvSprite.y * f.w);
    uvSprite.x = f.x + (uvSprite.x * f.z);

    return texture2D(diffuse, uvSprite);
}

vec4 getSpriteAtFrame(sampler2D diffuse, vec2 uv, vec4 frame, vec2 size, float bias) {
    vec4 f = frame;
    f.xz /= size.x;
    f.yw /= size.y;

    vec2 uvSprite = uv;
    uvSprite.y = (1.0 - f.w) - f.y + (uvSprite.y * f.w);
    uvSprite.x = f.x + (uvSprite.x * f.z);

    return texture2D(diffuse, uvSprite, bias);
}

/**
Trimmed frames
*/
vec4 getSpriteAtFrame(sampler2D diffuse, vec2 uv, vec4 frame, vec2 size, vec4 spriteSrcSize, vec2 srcSize) {
    vec4 f = frame;
    f.xz /= size.x;
    f.yw /= size.y;
    
    vec2 uvSprite = uv;
    
    uvSprite.x += (srcSize.x - spriteSrcSize.x) / srcSize.x;
    uvSprite.y -= (srcSize.y - spriteSrcSize.y) / srcSize.y;
    
    uvSprite.x -= 1.0;
    uvSprite /= spriteSrcSize.zw / srcSize;
    uvSprite.y += 1.0;
    
    vec2 uvCrop = uvSprite;
    
    uvSprite.y = (1.0 - f.w) - f.y + (uvSprite.y * f.w);
    uvSprite.x = f.x + (uvSprite.x * f.z);
    
    vec4 color = texture2D(diffuse, uvSprite);
    color.a *= crop(uvCrop);
    
    return color;
}

#pragma glslify: export(getSpriteAtFrame)
