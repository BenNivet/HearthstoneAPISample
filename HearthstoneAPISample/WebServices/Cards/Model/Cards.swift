//
//  Cards.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
import ObjectMapper

public class Cards: Mappable {
    
    var basic: [Card]?
    var classic: [Card]?
    
    init() {}
    
    public required init?(map: Map) {
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        basic <- map["Basic"]
        classic <- map["Classic"]
    }
}
