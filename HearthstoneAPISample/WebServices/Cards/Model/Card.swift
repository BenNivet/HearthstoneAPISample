//
//  Card.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
import ObjectMapper

public class Card: Mappable {

    var cardId: String?
    var dbfId: String?
    var name: String?
    var cardSet: String?
    var type: String?
    var text: String?
    
    var playerClass: String?
    var locale: String?
    
    var faction: String?
    var rarity: String?
    var cost: Int?
    var attack: Int?
    var health: Int?
    var flavor: String?
    var artist: String?
    var collectible: Bool?
    var elite: Bool?
    var race: String?
    var img: String?
    var imgGold: String?
    
    init() {}
    
    public required init?(map: Map) {
        self.mapping(map: map)
    }

    public func mapping(map: Map) {
        cardId <- map["cardId"]
        dbfId <- map["dbfId"]
        name <- map["name"]
        cardSet <- map["cardSet"]
        type <- map["type"]
        text <- map["text"]
        
        playerClass <- map["playerClass"]
        locale <- map["locale"]
        
        faction <- map["faction"]
        rarity <- map["rarity"]
        cost <- map["cost"]
        attack <- map["attack"]
        health <- map["health"]
        flavor <- map["flavor"]
        artist <- map["artist"]
        collectible <- map["collectible"]
        elite <- map["elite"]
        race <- map["race"]
        img <- map["img"]
        imgGold <- map["imgGold"]
    }
    
    var description: String {
        return String(format: "cardId: %@, name: %@, cardSet: %@,rarity: %@",
                      cardId ?? "",
                      name ?? "",
                      cardSet ?? "",
                      rarity ?? "")
    }
}

extension Card: Equatable {
    
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.cardId == rhs.cardId
    }
}
