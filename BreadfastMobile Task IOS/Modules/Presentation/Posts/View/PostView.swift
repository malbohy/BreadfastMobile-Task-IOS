//
//  PostView.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
import SwiftUI

struct PostView: View {
    let post: PostResponseData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let userImage = post.userAvatar {
                    Image(userImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                
                Text(post.userName ?? "User")
                    .font(.headline)
                    .bold()
            }
            .padding(.bottom, 10)
            
            Text(post.title)
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            Text(post.body)
                .font(.body)
        }
        .padding(20)
        .background(Color.clear)
    }
}
