//
//  ContentView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        
        NavigationView{
        OrderListView(orders: self.orderListVM.orders)
            
            .navigationBarTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
