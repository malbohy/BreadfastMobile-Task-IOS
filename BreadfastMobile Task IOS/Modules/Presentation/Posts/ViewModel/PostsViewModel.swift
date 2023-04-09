//
//  PostsViewModel.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
final class PostsViewModel: ObservableObject {
    private let useCase: PostsUseCase
    private let coordinator: PostsViewCoordinator
    @Published private(set) var viewState: ViewState = .init()

    init(useCase: PostsUseCase,
         coordinator: PostsViewCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }

    @MainActor
    func send(action: PostsViewModel.Actions) {
        switch action {
        case .viewLoaded: didLoadView()
            
        }
    }
}

// MARK: - Private functions
extension PostsViewModel {
    @MainActor
    func didLoadView() {
        getPosts()
    }
    
    @MainActor
    func getPosts() {
        viewState.isLoading = true
        Task {
            do {
                viewState.posts = try await useCase.execute()
            } catch {
                viewState.errorMessage = error.localizedDescription
                viewState.isLoading = false
                viewState.shouldShowError = true
            }
        }
    }
    
    func gotoPostDetails(post: PostEntity) -> PostDetailsView {
        return coordinator.goToPostDetails(post: post)
    }
}

extension PostsViewModel {
    struct ViewState {
        var errorMessage: String = ""
        var posts: PostsEntity = []
        var shouldShowError: Bool = false
        var isLoading: Bool = false
    }

    enum Actions {
        case viewLoaded
    }
}
