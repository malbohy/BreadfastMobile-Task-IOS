//
//  PostsDetailsCoordinator.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

struct PostDetailsCoordinator {
    let post: PostResponseData
    
    func build() -> PostDetailsView {
        let postsRepository = PostsRepository()
        let useCase = PostCommentsUseCase(postsRepository: postsRepository)
        let viewModel = PostDetailsViewModel(useCase: useCase, post: post, coordinator: self)
        let view = PostDetailsView(viewModel: viewModel)
        return view
    }
}
