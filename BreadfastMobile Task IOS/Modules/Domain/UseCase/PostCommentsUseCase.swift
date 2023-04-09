//
//  PostCommentsUseCase.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostCommentsUseCase {
    let postsRepository: PostsRepositoryProtocol
    
    func execute(postId: Int) async throws -> PostComments {
        try await postsRepository.getPostComments(postId: postId).map({$0.mapped()})
    }
}
