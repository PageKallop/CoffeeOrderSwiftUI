//
//  OrderListView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/18/21.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        
        self.orders = orders
    }
    var body: some View {
        List{
            ForEach(self.orders, id:\.id) { order in
                HStack {
                    Image(order.coffeeName)
                    .resizable()
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: OrderModel(name: "Mary", size: "Small", coffeeName: "Regular", total: 3.0))])
    }
}
