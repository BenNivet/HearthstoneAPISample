//
//  ServiceProvider.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//
import Foundation
import Alamofire
import ObjectMapper

public class ServiceProvider {
    func executeRequest(request: URLRequest, adaptType: URLRequest.AdaptType, success: @escaping (Any) -> Void, failure: @escaping (Error?) -> Void) {
        Logger.info("REQUEST - \(request.url?.absoluteString ?? "")")
        Alamofire.request(request.adapt(adaptType: adaptType))
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    Logger.info("Success - \(request.url?.absoluteString ?? "")")
                    success(value)
                case .failure(let error):
                    Logger.info("Failure - \(request.url?.absoluteString ?? "") - \(error.localizedDescription)")
                    failure(error)
                }
        }
    }
}
