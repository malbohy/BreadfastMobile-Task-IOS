//
//  PostsView.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import SwiftUI

struct PostsView: View {
    @StateObject var viewModel: PostsViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        Text("Posts")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 50)
                            .padding(.bottom, 20)
                        List(viewModel.viewState.posts) { post in
                            NavigationLink {                                
                                viewModel.gotoPostDetails(post: post)
                                
                            } label: {
                                PostView(post: post)
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear(perform: {
                viewModel.send(action: .viewLoaded)
            })
            .background(.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: 16))
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(viewModel: PostsViewModel(useCase: PostsUseCase(postsRepository: PostsRepository()), coordinator: PostsViewCoordinator()))
    }
}
