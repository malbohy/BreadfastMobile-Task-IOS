//
//  PostsRepository.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostsRepository: PostsRepositoryProtocol, ServiceHandler {
    func getPosts() async throws  -> PostsResponse {
        let response = try await request(endPoint: PostsEndPoint(), model: PostsResponse.self)
        print(response)
        return response
    }
}
