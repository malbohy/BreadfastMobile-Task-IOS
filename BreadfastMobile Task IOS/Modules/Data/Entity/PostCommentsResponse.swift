//
//  PostCommentsResponse.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostCommentsResponseData: Identifiable, Codable {
    let id: Int
    let post_id: Int
    let name: String
    let email: String
    let body: String
    let avatar: String?
}

typealias PostsCommentsResponse = [PostCommentsResponseData]
