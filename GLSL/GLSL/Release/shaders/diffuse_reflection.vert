#version 430 core

uniform mat4 mvp;
uniform mat4 object_to_world;
uniform mat3 normal_matrix;
uniform vec3 light_direction;
uniform vec3 light_color;

layout(location = 0) in vec3 vertex_position;
layout(location = 1) in vec3 vertex_color;
layout(location = 2) in vec3 vertex_normal;
out vec3 color;

void main(){

	vec3 transformed_normal = normalize(normal_matrix * vertex_normal);
	vec3 position_to_light = vec3(light_direction);
	position_to_light = normalize(position_to_light);
	vec4 world_coord_position = object_to_world*vec4(vertex_position, 1);
	color = light_color * vertex_color * max(dot(transformed_normal,position_to_light), 0.0);
	gl_Position = mvp*object_to_world*vec4(vertex_position, 1);
}	