//
//  godot_jwt.h
//  godot-jwt
//
//  Created by Aashutosh Shrestha on 3/13/23.
//

#define PLUGIN_NAME String("GodotJWT")

#define JWT_ENCODE_SUCCESS "jwt_encode_success"
#define JWT_DECODE_SUCCESS "jwt_decode_success"
#define JWT_ERROR "jwt_error"

void godot_jwt_init();
void godot_jwt_deinit();
