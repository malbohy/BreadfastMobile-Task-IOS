//
//  PostCommentEntity.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 10/04/2023.
//

import Foundation

struct PostCommentEntity: Identifiable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
    let avatar: String
}

typealias PostComments = [PostCommentEntity]

extension PostCommentsResponseData {
    func mapped() -> PostCommentEntity {
        .init(id: id,
              postId: postId,
              name: name,
              email: email,
              body: body,
              avatar: avatar ?? "")
    }
}
