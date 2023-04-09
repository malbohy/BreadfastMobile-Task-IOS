//
//  PostsUseCase.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostsUseCase {
    let postsRepository: PostsRepositoryProtocol
    
    func execute() async throws -> PostsEntity {
        try await postsRepository.getPosts().map({$0.mapped()})
    }
}


