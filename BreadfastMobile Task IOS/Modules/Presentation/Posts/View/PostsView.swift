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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Posts View")
            
            
            List {
                ForEach(viewModel.viewState.posts) { post in
//                    self.buildView(types: self.myTypes, index: index)
                    
                    Text(post.title!)
                }
            }
            
            
            
            
            
            Button("get Posts") {
                print("posts Request")
                Task {
                    try? await PostsUseCase(postsRepository: PostsRepository()).execute()
                    
                    
//                    let responser = try? await  PostsRepository().getPosts()
                    
                }
                
            }
            
        }
        .padding()
        .onAppear(perform: {
            viewModel.send(action: .viewLoaded)
        })
        
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(viewModel: PostsViewModel(useCase: PostsUseCase(postsRepository: PostsRepository())))
    }
}
