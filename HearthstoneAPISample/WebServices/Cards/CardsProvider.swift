//  CardsProvider.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol CardsProviderProtocol {
    func getAllCards(success: @escaping (Cards?) -> Void, failure: @escaping (Error?) -> Void)
    func getCard(name: String, success: @escaping (Card?) -> Void, failure: @escaping (Error?) -> Void)
    func getCardsSearch(name: String, success: @escaping ([Card]?) -> Void, failure: @escaping (Error?) -> Void)
    
}

public class CardsProvider: ServiceProvider {}

extension CardsProvider: CardsProviderProtocol {
    
    public func getAllCards(success: @escaping (Cards?) -> Void, failure: @escaping (Error?) -> Void) {
        var request: URLRequest
        do {
            request = try CardsRouter.getAllCards().asURLRequest()
        } catch let error {
            return failure(error)
        }

        executeRequest(request: request, adaptType: .heartStone, success: { value in
            let data = Mapper<Cards>().map(JSONObject: value)
            success(data)
        }, failure: failure)
    }
    
    public func getCard(name: String, success: @escaping (Card?) -> Void, failure: @escaping (Error?) -> Void) {
        var request: URLRequest
        do {
            request = try CardsRouter.getCard(name: name).asURLRequest()
        } catch let error {
            return failure(error)
        }
        
        executeRequest(request: request, adaptType: .heartStone, success: { value in
            let data = Mapper<Card>().mapArray(JSONObject: value)?.first
            success(data)
        }, failure: failure)
    }
    
    public func getCardsSearch(name: String, success: @escaping ([Card]?) -> Void, failure: @escaping (Error?) -> Void) {
        var request: URLRequest
        do {
            request = try CardsRouter.getCardSearch(name: name).asURLRequest()
        } catch let error {
            return failure(error)
        }
        
        executeRequest(request: request, adaptType: .heartStone, success: { value in
            let data = Mapper<Card>().mapArray(JSONObject: value)
            success(data)
        }, failure: failure)
    }
}
