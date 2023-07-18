shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float shift = 0.1;

void fragment() {
	vec2 uv = SCREEN_UV;

	vec4 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba;
	c.r = texture(SCREEN_TEXTURE, vec2(uv.x+shift, uv.y)).r;
	c.b = texture(SCREEN_TEXTURE, vec2(uv.x, uv.y+shift)).b;
    COLOR = c;
}
