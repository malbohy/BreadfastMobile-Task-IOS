//
//  ServiceHandler.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation

protocol ServiceHandler {
    func request<Model: Codable>(endPoint: Endpoint, model: Model.Type) async throws -> Model
}
extension ServiceHandler {
    func request<Model: Codable>(endPoint: Endpoint, model: Model.Type) async throws -> Model {
        let responseData = try await makeRequest(endPoint: endPoint)
        let decoder = JSONDecoder()
        let model = try decoder.decode(model, from: responseData)
        return model
    }
}

fileprivate extension ServiceHandler {
    func makeRequest(endPoint: Endpoint) async throws -> Data {
        do {
            let request = try endPoint.toURLRequest()
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw NSError(domain: "Server Error", code: (response as? HTTPURLResponse)?.statusCode ?? -1, userInfo: nil)
            }
            return data
        } catch {
            throw error
        }
    }
}
