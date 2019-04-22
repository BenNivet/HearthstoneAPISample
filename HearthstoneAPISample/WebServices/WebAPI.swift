//
//  WebAPI.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

struct WebAPI {
    
    struct Constants {
        static let baseURL      = "https://omgvamp-hearthstone-v1.p.rapidapi.com"
    }
    
    struct Headers {
        struct RapidAPIHost {
            static let key      = "X-RapidAPI-Host"
            static let value    = "omgvamp-hearthstone-v1.p.rapidapi.com"
        }
        struct RapidAPIKey {
            static let key      = "X-RapidAPI-Key"
            static let value    = "5a104e978fmsh029ba457de397f8p193754jsn0899c2be0742"
        }
    }
}
