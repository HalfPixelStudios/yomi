shader_type canvas_item;
//render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba;
    c.r = 1.0 - c.r;
    c.b = 1.0 - c.b;
    c.g = 1.0 - c.g;
    COLOR.rgba = c;
}
