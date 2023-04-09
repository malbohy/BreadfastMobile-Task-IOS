//
//  PostDetailsViewModel.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

final class PostDetailsViewModel: ObservableObject {
    private let useCase: PostCommentsUseCase
    private let coordinator: PostDetailsCoordinator
    private let post: PostEntity
    @Published private(set) var viewState: ViewState = .init()

    init(useCase: PostCommentsUseCase,
         post: PostEntity,
         coordinator: PostDetailsCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
        self.post = post
        viewState.post = post
    }

    @MainActor
    func send(action: PostsViewModel.Actions) {
        switch action {
        case .viewLoaded: didLoadView()
            
        }
    }
}

// MARK: - Private functions
extension PostDetailsViewModel {
    @MainActor
    func didLoadView() {
        getComments()
    }
    
    @MainActor
    func getComments() {
        viewState.isLoading = true
        Task {
            do {
                viewState.postComments = try await useCase.execute(postId: post.id)
            } catch {
                viewState.errorMessage = error.localizedDescription
                viewState.isLoading = false
                viewState.shouldShowError = true
            }
        }
    }
}

extension PostDetailsViewModel {
    struct ViewState {
        var errorMessage: String = ""
        var postComments: PostComments = []
        var post: PostEntity?
        var shouldShowError: Bool = false
        var isLoading: Bool = false
    }

    enum Actions {
        case viewLoaded
    }
}
