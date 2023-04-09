//
//  PostsDetailsCoordinator.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostsDetailsCoordinator {
    
    init(postId: Int) {
        
    }
    
    func build() -> PostDetailsView {
//        let postsRepository = PostsRepository()
//        let useCase = PostsUseCase(postsRepository: postsRepository)
//        let viewModel = PostsViewModel(useCase: useCase)
        let view = PostDetailsView()
        return view
    }
}
