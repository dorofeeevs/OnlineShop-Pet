//
//  NetworkService.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/8/21.
//

import Foundation

protocol NetworkServiceProtocol {
    func getProducts(completion: @escaping (Result<[Product]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getProducts(completion: @escaping (Result<[Product]?, Error>) -> Void) {
        let urlString = "http://localhost:5000/api/Products"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Product].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
