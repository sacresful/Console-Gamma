#version 120

varying vec4 texcoord;
uniform sampler2D gcolor;

uniform float gamma       = 1.0;       // Higher values brighten, lower values darken

float tweakedGamma = gamma >= 0.5
    ? (gamma - 0.5) * 1.12 + 1.08
    : gamma * 0.96 + 0.6;

void main() {
    vec2 point = texcoord.st;
    vec3 color = texture2D(gcolor, point).rgb;
    
    color = pow(color, vec3(1.0 / tweakedGamma));
    
    gl_FragColor = vec4(color, 1.0);
}
