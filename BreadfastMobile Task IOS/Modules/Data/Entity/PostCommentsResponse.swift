//
//  PostCommentsResponse.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostCommentsResponseData: Identifiable, Codable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case postId = "post_id"
        case name
        case email
        case body
        case avatar
    }
}

typealias PostsCommentsResponse = [PostCommentsResponseData]
