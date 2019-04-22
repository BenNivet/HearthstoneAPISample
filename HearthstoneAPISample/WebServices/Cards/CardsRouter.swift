//  CardsRouter.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
import Alamofire

enum CardsRouter: URLRequestConvertible {

    private struct Constants {
        static let getAllCardsPath = "/cards"
        static let getCardPath = "/cards/%@"
        static let getCardSearchNamePath = "/cards/search/%@"
    }

    case getAllCards()
    case getCard(name: String)
    case getCardSearch(name: String)

    var method: HTTPMethod {
        switch self {
        case .getAllCards:
            return .get
        case .getCard:
            return .get
        case .getCardSearch:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getAllCards:
            return Constants.getAllCardsPath
        case .getCard(let name):
            return String(format: Constants.getCardPath, name)
        case .getCardSearch(let name):
            return String(format: Constants.getCardSearchNamePath, name)
        }
    }

    func asURLRequest() throws -> URLRequest {
        guard let urlComponents: URLComponents = URLComponents(string: WebAPI.Constants.baseURL.appending(path)) else { throw URLError(.badURL) }
        
        if let url = urlComponents.url {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)

            return urlRequest
        } else {
            throw URLError(.badURL)
        }
    }
}
