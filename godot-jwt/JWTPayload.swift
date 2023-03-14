//
//  JWTPayload.swift
//  godot-jwt
//
//  Created by Aashutosh Shrestha on 3/13/23.
//

import Foundation
import CupertinoJWT
public struct JWTPayload: Codable {
    private struct Header: Codable {
        /// alg
        let algorithm: String = "ES256"

        /// kid
        let keyID: String

        enum CodingKeys: String, CodingKey {
            case algorithm = "alg"
            case keyID = "kid"
        }
    }

    private struct Payload: Codable {
        /// iss
        public let teamID: String

        /// iat
        public let issueDate: Int

        /// exp
        public let expireDate: Int
        
        ///aud
        public let aud: String
        
        ///sub
        public let sub: String

        enum CodingKeys: String, CodingKey {
            case teamID = "iss"
            case issueDate = "iat"
            case expireDate = "exp"
            case aud = "aud"
            case sub = "sub"
        }
    }

    private let header: Header

    private let payload: Payload

    public init(keyID: String, teamID: String, aud: String, sub: String, issueDate: Date, expireDuration: TimeInterval) {

        header = Header(keyID: keyID)

        let iat = Int(issueDate.timeIntervalSince1970.rounded())
        let exp = iat + Int(expireDuration)

        payload = Payload(teamID: teamID, issueDate: iat, expireDate: exp, aud: aud, sub: sub)
    }

    /// Combine header and payload as digest for signing.
    public func digest() throws -> String {
        let headerString = try JSONEncoder().encode(header.self).base64EncodedURLString()
        let payloadString = try JSONEncoder().encode(payload.self).base64EncodedURLString()
        return "\(headerString).\(payloadString)"
    }

    /// Sign digest with P8(PEM) string. Use the result in your request authorization header.
    public func sign(with p8: P8) throws -> String {
        let digest = try self.digest()

        let signature = try p8.toASN1()
            .toECKeyData()
            .toPrivateKey()
            .es256Sign(digest: digest)

        let token = "\(digest).\(signature)"
        return token
    }
}
extension Data {
    func base64EncodedURLString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }
}
