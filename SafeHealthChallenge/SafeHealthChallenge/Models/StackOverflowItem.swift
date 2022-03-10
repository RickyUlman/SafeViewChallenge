//
//  StackOverflowItem.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import Foundation

struct StackOverflowItem: Decodable {
    let owner: StackOverflowOwner
    let title: String
    let link: String
}
