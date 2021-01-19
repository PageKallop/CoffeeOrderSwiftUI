//
//  AddCoffeeOrderView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/19/21.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    
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
                            CoffeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                            
                        }
                    }
                    
                    Section(header: Text("Select Coffee").font(.body),
                            footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("",selection: self.$addCoffeeOrderVM.size) {
                            Text("Small")
                                .tag("Small")
                            
                            Text("Medium")
                                .tag("Medium")
                            
                            Text("Lage")
                                .tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                Button("Place Order") {
                    self.addCoffeeOrderVM.placeOrder()
                    self.isPresented = false
                }
                }.padding()
                .foregroundColor(Color.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 133/255))
                .cornerRadius(10)
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeCellView: View {
   
    
    let coffee: CoffeeViewModel
    
    @Binding var selection: String
    
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
