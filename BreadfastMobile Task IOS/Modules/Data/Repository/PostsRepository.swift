//
//  PostsRepository.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostsRepository: PostsRepositoryProtocol, ServiceHandler {
    func getPosts() async throws  -> PostsResponse {
        try await request(endPoint: PostsEndPoint(), model: PostsResponse.self)
    }
    
    func getPostComments(postId: Int) async throws -> PostsCommentsResponse {
        try await request(endPoint: PostCommentsEndPoint(postId: postId), model: PostsCommentsResponse.self)
    }
}
