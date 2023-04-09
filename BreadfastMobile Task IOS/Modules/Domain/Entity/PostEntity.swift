//
//  PostEntity.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 10/04/2023.
//

import Foundation

struct PostEntity: Identifiable {
    let id: Int
    let userId: Int
    let userAvatar: String
    let userName: String
    let title: String
    let body: String
}

typealias PostsEntity = [PostEntity]

extension PostResponseData {
    func mapped() -> PostEntity {
        return .init(id: id,
                     userId: userId ?? 0,
                     userAvatar: userAvatar ?? "",
                     userName: userName ?? "User",
                     title: title,
                     body: body)
    }
}
