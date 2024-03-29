//
//  godot_jwt.m
//  godot-jwt
//
//  Created by Aashutosh Shrestha on 3/13/23.
//

#include <Foundation/Foundation.h>

#include "godot_jwt.h"
#include "godot_jwt_implementation.h"

#include "core/engine.h"

GodotJWT *godotJWT;

void godot_jwt_init() {
    godotJWT = memnew(GodotJWT);
    Engine::get_singleton()->add_singleton(Engine::Singleton(PLUGIN_NAME, godotJWT));
}

void godot_jwt_deinit() {
    if (godotJWT) {
       memdelete(godotJWT);
   }
}
