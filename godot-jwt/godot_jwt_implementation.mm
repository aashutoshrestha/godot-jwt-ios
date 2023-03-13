//
//  godot_jwt_implementation.m
//  godot-jwt
//
//  Created by Aashutosh Shrestha on 3/13/23.
//

#import <Foundation/Foundation.h>
#import <godot_jwt-Swift.h>
#include "core/project_settings.h"
#include "core/class_db.h"
#include "godot_jwt.h"
#include "godot_jwt_implementation.h"
NSString* to_nsstring(String str) {
    return [[NSString alloc] initWithUTF8String:str.utf8().get_data()];
}

String from_nsstring(NSString* str) {
    const char *s = [str UTF8String];
    return String::utf8(s != NULL ? s : "");
}
void GodotJWT::_bind_methods() {
    ClassDB::bind_method(D_METHOD("getEncodedJWT"), &GodotJWT::getEncodedJWT);
}

String GodotJWT::getEncodedJWT() {
    String token = from_nsstring([GodotJWTSwift generateJWT]);
    return token;
}

GodotJWT::GodotJWT(){
    
}
GodotJWT::~GodotJWT(){
    
}
