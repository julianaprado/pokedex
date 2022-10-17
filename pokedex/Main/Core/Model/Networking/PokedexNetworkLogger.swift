//
//  PokedexNetworkLogger.swift
//  pokedex
//
//  Created by Juliana Prado on 16/10/22.
//

import Foundation
import Alamofire

class PokedexNetworkLogger: EventMonitor {
    
    let queue = DispatchQueue(label: StringConstants.dispatchQueue)
    
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }

    func request<Value>(
        _ request: DataRequest,
        didParseResponse response: DataResponse<Value, AFError>
    ) {
        guard let data = response.data else {
            return
        }
        if let json = try? JSONSerialization
            .jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
