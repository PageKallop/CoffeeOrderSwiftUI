//
//  AddCoffeeOrderView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/19/21.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeOrderViewModel()
   
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("INFO").font(.body)) {
                        TextField("Enter name", text:
                        self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("Select Coffee").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                            
                            HStack{
                            Image(coffee.imageURL)
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(coffee.name)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}
