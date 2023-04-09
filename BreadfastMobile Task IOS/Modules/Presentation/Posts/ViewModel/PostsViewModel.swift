//
//  PostsViewModel.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
final class PostsViewModel: ObservableObject {
    private let useCase: PostsUseCase
    @Published private(set) var viewState: ViewState = .init()

    init(useCase: PostsUseCase) {
        self.useCase = useCase
    }

    @MainActor
    func send(action: PostsViewModel.Actions) {
        switch action {
            case .viewLoaded: didLoadView()
        }
    }
}

// MARK: - Private functions
private extension PostsViewModel {
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
    
    func gotoPostDetails(_ opened: Bool) {
        
    }
}

extension PostsViewModel {
    struct ViewState {
        var errorMessage: String = ""
        var posts: PostsResponse = []
        var shouldShowError: Bool = false
        var isLoading: Bool = false
    }

    enum Actions {
        case viewLoaded
    }
}
