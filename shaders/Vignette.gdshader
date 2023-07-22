shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec4 color: source_color;
uniform float multiplier = 0.2;
uniform float softness = 3.0;

void fragment() {
	float value = distance(UV ,vec2(0.5));
	COLOR = vec4(color.rgb, smoothstep(multiplier, softness, value));
}
