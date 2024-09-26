shader_type spatial;

uniform sampler2D noise;
uniform sampler2D roughTexture;
uniform sampler2D waterTexture;

uniform float waterLevel = 0.96;
uniform vec3 waterColor : source_color;
uniform vec3 landColor : source_color;
uniform bool glowingWater = false;

void vertex() {
	float noiseUv = texture(noise, UV).r;
	if (noiseUv <= waterLevel)
	{
		VERTEX *= waterLevel;
	}
	else
	{
		VERTEX *= noiseUv;
	}
}

void fragment() {
	float noiseUv = texture(noise, UV).r;
	if (noiseUv <= waterLevel)
	{
		ALBEDO = waterColor;
		if (glowingWater)
		{
			EMISSION = texture(roughTexture, UV).rgb * waterColor;
		}
		else
		{
			ROUGHNESS = texture(waterTexture, UV * 5.0).r;
			SPECULAR = 1.0;
		}
	}
	else
	{
		ALBEDO = texture(roughTexture, UV).rgb * landColor;
	}
}
