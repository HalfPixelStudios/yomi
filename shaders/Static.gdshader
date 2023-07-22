shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float intensity = 0.7;
uniform float scale = 1;

float random(vec2 uv, float time) {
    return fract(sin(dot(uv.xy, vec2(12.9898,78.233)) + time) * 43758.5453123);
}

void fragment() {
	vec4 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba;
	c.a = random(SCREEN_UV * scale, TIME) * intensity;
	COLOR = c;
}
