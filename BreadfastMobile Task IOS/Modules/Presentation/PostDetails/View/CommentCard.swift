//
//  CommentCard.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 10/04/2023.
//

import Foundation
import SwiftUI

struct CommentCard: View {
    let name: String
    let avatar: String?
    let content: String

    var body: some View {
        HStack(alignment: .top) {
            if let avatar = avatar {
                Image(avatar)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)

                Text(content)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
    }
}
