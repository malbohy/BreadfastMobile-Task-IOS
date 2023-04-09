//
//  PostCommentsEndPoint.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
struct PostCommentsEndPoint: Endpoint {
    let postId: Int
    var baseUrl: String = Constant.baseURL
    var path: String {
        return  "posts/\(postId)/comments"
    }
    var headers: [String : String]? = [:]
    var body: Encodable? = nil
    var method: HTTPMethodType = .get
    var query: [String : String]? = [:]
    var isDebuggable: Bool = true
}
