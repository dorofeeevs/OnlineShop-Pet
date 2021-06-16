//
//  ProductPresenter.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/7/21.
//

import Foundation

class ProductPresenter: ProductViewPresenter {
    private(set) var products: [Product]?
    private weak var view: ProductView?
    private let networkService: NetworkServiceProtocol?

    required init(view: ProductView, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getProducts()
    }

    func getProducts() {
        networkService?.getProducts { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    self.view?.successfulRequest()
                case .failure(let error):
                    self.view?.failureRequest(error: error)
                }
            }
        }
    }
}
