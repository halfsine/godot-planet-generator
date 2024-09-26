shader_type spatial;

uniform sampler2D cloud;
uniform sampler2D distort;
uniform vec2 wind = vec2(2.0, 0.0);
uniform vec3 color : source_color;

void fragment() {
	ALBEDO = texture(cloud, vec2(UV + (TIME * wind) + (texture(distort, UV).r * 0.025))).rgb + color;
	ALPHA = texture(cloud, vec2(UV + (TIME * wind) + (texture(distort, UV).r * 0.025))).a;
}
