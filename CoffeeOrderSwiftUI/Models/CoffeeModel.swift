//
//  CoffeeModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/18/21.
//

import Foundation

struct CoffeeModel {
    
    let name: String
    let imageURL: String
    let price: Double
}

extension CoffeeModel {
    
    static func all() -> [CoffeeModel] {
        return [
            CoffeeModel(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            CoffeeModel(name: "Espresso", imageURL: "Espresso", price: 2.1),
            CoffeeModel(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
