//
//  PostsEndPoint.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
struct PostsEndPoint: Endpoint {
    var baseUrl: String = "https://gorest.co.in/public/v2/"
    var path: String = "posts"
    var headers: [String : String]? = [:]
    var body: Encodable? = nil
    var method: HTTPMethodType = .get
    var query: [String : String]? = [:]
    var isDebuggable: Bool = true
}
