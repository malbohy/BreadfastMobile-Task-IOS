//
//  PostsResponse.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostResponseData:Identifiable, Codable {
    let id: Int
    let userId: Int?
    let title: String?
    let body: String?
}

typealias PostsResponse = [PostResponseData]
