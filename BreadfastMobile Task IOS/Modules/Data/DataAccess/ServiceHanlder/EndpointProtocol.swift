//
//  Endpoint.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
protocol Endpoint {
    
    var baseUrl: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var body: Encodable? { get }
    var method: HTTPMethodType { get }
    var query: [String: String]? { get }
    
    var isDebuggable: Bool { get }
    func toURLRequest() throws -> URLRequest
}

extension Endpoint {
    func buildURLComponents(baseURL: String, urlParameters: [String: String]) -> String {
        var comps = URLComponents(string: baseURL)!
        for urlParameter in urlParameters {
            let searchText = URLQueryItem(name: urlParameter.key, value: urlParameter.value)
            if comps.queryItems == nil {
                comps.queryItems = [searchText]
            } else {
                comps.queryItems?.append(searchText)
            }
        }
        guard let url = comps.url?.description  else { fatalError("Search URL Components Error") }
        return url
    }
    
    func toURLRequest() throws -> URLRequest {
        var url = ""
        switch method {
        case .get:
            url = buildURLComponents(baseURL: baseUrl + path, urlParameters: query ?? [:])
        default:
            url = baseUrl + path
        }
        guard let url = URL(string: url) else {
            throw ApplicationError.badURL
        }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        headers?.forEach({ (key, value) in
            request.setValue(key, forHTTPHeaderField: value)
        })
        request.httpMethod = method.rawValue
        request.httpBody = body?.JSONDictionary()?.percentEncoded()
        return request
    }
    
}
