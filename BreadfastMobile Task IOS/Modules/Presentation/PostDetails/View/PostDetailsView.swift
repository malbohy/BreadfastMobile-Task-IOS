//
//  PostDetailsView.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import SwiftUI

struct PostDetailsView: View {
    @StateObject var viewModel: PostDetailsViewModel
    
    var body: some View {
        
        VStack {
            if let post = viewModel.viewState.post {
                PostView(post: post)
                List(viewModel.viewState.postComments) { comment in
                    CommentCard(name: comment.name, avatar: comment.avatar, content: comment.body)
                }
            }
        }.onAppear(perform: {
            viewModel.getComments()
        })
        
        
        
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(
            viewModel: PostDetailsViewModel(
                useCase: PostCommentsUseCase(
                    postsRepository: PostsRepository()),
                post: PostEntity(id: 0,
                                       userId: 0,
                                       userAvatar: "",
                                       userName: "",
                                       title: "",
                                       body: ""),
                coordinator: PostDetailsCoordinator(
                    post: PostEntity(
                        id: 0,
                        userId: 0,
                        userAvatar: "",
                        userName: "",
                        title: "",
                        body: ""))))
    }
}


