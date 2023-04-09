//
//  PostsViewCoordinator.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
struct PostsViewCoordinator {
    func build() -> PostsView {
        let postsRepository = PostsRepository()
        let useCase = PostsUseCase(postsRepository: postsRepository)
        let viewModel = PostsViewModel(useCase: useCase, coordinator: PostsViewCoordinator())
        let view = PostsView(viewModel: viewModel)
        return view
    }
    
    func goToPostDetails(post: PostEntity) -> PostDetailsView {
        PostDetailsCoordinator(post: post).build()
    }
}
