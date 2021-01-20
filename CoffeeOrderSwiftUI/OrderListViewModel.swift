//
//  OrderListViewModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/18/21.
//

import Foundation


class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        WebService().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}


class OrderViewModel {
    
    let id = UUID()
    
    var order: OrderModel
    
    init(order: OrderModel) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var total: Double {
        return self.order.total
    }
    
}
