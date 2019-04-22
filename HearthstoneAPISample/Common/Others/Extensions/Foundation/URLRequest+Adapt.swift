//
//  URLRequest+Adapt.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
import RxSwift

extension URLRequest {
    
    enum AdaptType {
        case heartStone
    }
    
    func adapt(adaptType: AdaptType) -> URLRequest {
        
        var urlRequest = self
        
        switch adaptType {
        case .heartStone:
            urlRequest.setValue(WebAPI.Headers.RapidAPIHost.value,
                                forHTTPHeaderField: WebAPI.Headers.RapidAPIHost.key)
            urlRequest.setValue(WebAPI.Headers.RapidAPIKey.value,
                                forHTTPHeaderField: WebAPI.Headers.RapidAPIKey.key)
        }
        
        return urlRequest
    }
}
