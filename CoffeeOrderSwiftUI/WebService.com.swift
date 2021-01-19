//
//  WebService.com.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/18/21.
//

import Foundation

class WebService {
    
    
    func getAllOrders(completion: @escaping ([OrderModel]?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
           let orders = try? JSONDecoder().decode([OrderModel].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
            
        }.resume()
    }
}
