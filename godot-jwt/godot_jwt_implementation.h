//
//  godot_jwt_implementation.h
//  godot-jwt
//
//  Created by Aashutosh Shrestha on 3/13/23.
//

#ifndef godot_jwt_implementation_h
#define godot_jwt_implementation_h


#include "core/object.h"
#include "io/json.h"
#include "godot_jwt.h"
#include "core/engine.h"

class GodotJWT : public Object {
    GDCLASS(GodotJWT, Object);
    
    static void _bind_methods();
    
public:
    
    String getEncodedJWT();
    
    GodotJWT();
    ~GodotJWT();
};

#endif /* godot_jwt_implementation_h */
