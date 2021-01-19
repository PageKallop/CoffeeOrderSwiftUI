//
//  OrderTotalView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/19/21.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format:
            "$%.2f",self.total)).font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding(20)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.45)
    }
}
