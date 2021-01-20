//
//  AddCoffeOrderViewModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/19/21.
//

import Foundation


class AddCoffeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webservice: WebService
    
    var coffeeList: [CoffeeViewModel] {
        return CoffeeModel.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webservice = WebService()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = OrderModel(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        self.webservice.createCoffeeOder(order: order) { _ in
            print("Order Complete")
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large": 4.0]
        
        return prices[self.size] ?? 0.0
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
