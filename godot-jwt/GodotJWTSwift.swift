//
//  GodotJWTSwift.swift
//  godot-jwt
//
//  Created by Aashutosh Shrestha on 3/13/23.
//

import Foundation
import CupertinoJWT

@objcMembers public class GodotJWTSwift : NSObject{
@objc static func generateJWT() -> String {
            
    if let path = Bundle.main.path(forResource: Configs().getP8KeyID(), ofType: "txt") {
            var p8Str: String?
            do {
                p8Str = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            } catch let e{
                print(e)
                return ""
            }
            //Create a Configs.swift file with your keyID issuer ID or pass them directly here
            let jwt = JWT(keyID: Configs().getKeyID(), teamID: Configs().getIssuerID(), issueDate: Date(), expireDuration: 60*60)
            do {
                let token = try jwt.sign(with: p8Str!)
                return token
            } catch let e {
                print(e)
                return ""
            }
    }
    
        return ""
    }
}

