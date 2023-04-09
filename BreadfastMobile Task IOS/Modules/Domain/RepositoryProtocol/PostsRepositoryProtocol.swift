//
//  PostsRepositoryProtocol.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
protocol PostsRepositoryProtocol {
    func getPosts() async throws  -> PostsResponse
}
