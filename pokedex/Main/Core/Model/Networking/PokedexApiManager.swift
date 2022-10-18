//
//  PokedexApiManager.swift
//  pokedex
//
//  Created by Juliana Prado on 16/10/22.
//

import Foundation
import Alamofire

class PokedexApiManager {
    
    static let shared = PokedexApiManager()
    
    private var images = NSCache<NSString, NSData>()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        
        let networkLogger = PokedexNetworkLogger()
        
        return Session(
            configuration: configuration,
            cachedResponseHandler: responseCacher,
            eventMonitors: [networkLogger])
    }()
    
    func fetchPokemonImage(url: String, completion: @escaping (Data?) -> Void) {
        if let image = images.object(forKey: url as NSString){
            completion(image as Data)
            return
        }
        
        sessionManager.request(url)
            .response { response in
                switch response.result {
                case .success(_):
                    guard let image = response.value else {
                        return
                    }
                    self.images.setObject(image! as NSData, forKey: url as NSString)
                    completion(image)
                    
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
    func fetchPokemon(url: String, completion: @escaping (IndividualPokemon) -> Void) {
        sessionManager.request(url)
            .responseDecodable(of: IndividualPokemon.self) { response in
                guard let pokemon = response.value else {
                    return
                }
                completion(pokemon)
            }
    }
    
    func searchResults(completion: @escaping ([Pokemon]) -> Void) {
        let url = StringConstants.baseUrl
        sessionManager.request(url)
            .responseDecodable(of: Results.self) { response in
                switch response.result {
                    
                case .success(_):
                    guard let items = response.value else {
                        return completion([])
                    }
                    completion(items.results)
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
    func searchSpecies(url: String, completion: @escaping (PokemonSpecies) -> Void) {
        sessionManager.request(url)
            .responseDecodable(of: PokemonSpecies.self) { response in
                switch response.result {
                    
                case .success(_):
                    guard let items = response.value else {
                        return
                    }
                    completion(items)
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
    func fechDescription(url: String, completion: @escaping (AbilityEntry) -> Void) {
        sessionManager.request(url)
            .responseDecodable(of: AbilityEntry.self) { response in
                switch response.result {
                    
                case .success(_):
                    guard let items = response.value else {
                        return
                    }
                    completion(items)
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
}
