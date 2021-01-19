//
//  CoffeeViewModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/19/21.
//

import Foundation


class coffeeListViewModel {
    
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: CoffeeModel
    
    init(coffee: CoffeeModel) {
        
        self.coffee = coffee
    }
        
        var name: String {
            return self.coffee.name
        }
        
        var imageURL: String {
            return self.coffee.imageURL
        }
        
        var price: Double {
            return self.coffee.price
        }
    
}
