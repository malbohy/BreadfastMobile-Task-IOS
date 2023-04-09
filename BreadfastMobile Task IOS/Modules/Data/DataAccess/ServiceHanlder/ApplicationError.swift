//
//  ApplicationError.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import Foundation
enum ApplicationError: Error {
    case notConnectedToInternet
    case unexpectedError
    case decoderError
    case badURL
}
