//
//  StackOverflowOwner.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import Foundation

struct StackOverflowOwner: Decodable {
    let displayName: String
    let profileImage: String
    private enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case profileImage = "profile_image"
    }
}
