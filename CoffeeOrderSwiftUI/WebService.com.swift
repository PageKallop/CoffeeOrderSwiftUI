//
//  WebService.com.swift
//  CoffeeOrderSwiftUI
//
//  Created by Page Kallop on 1/18/21.
//

import Foundation

class WebService {
    
    func createCoffeeOder(order: OrderModel, completion: @escaping (CreateOrderResponce?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-T")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            guard let data = data, error == nil else {
                
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let createOrderResponce = try? JSONDecoder().decode(CreateOrderResponce.self, from: data)
            DispatchQueue.main.async {
                completion(createOrderResponce)
            }
            
            
        } .resume()
    }
    
    
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
