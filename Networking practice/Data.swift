//
//  Data.swift
//  Networking practice
//
//  Created by kalyan on 3/12/26.
//

import Foundation
import Observation

@Observable


class JokeViewModel{
    
    var joke: JokeView? = nil
    var isLoading = false
    var errorMessage: String? = nil
    
    func fetchData() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else{
            errorMessage = "Invalid url"
            isLoading = false
            return
        }
        let request = URLRequest(url: url)
        
        do{
            let(data, response) = try await URLSession.shared.data(for: request)
            
            if let http = response as? HTTPURLResponse {
                      print("Status code: \(http.statusCode)")
                  }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                       print("Raw JSON: \(jsonString)")
                   }
           
            
             joke = try JSONDecoder().decode(JokeView.self, from: data)
            
            print("Joke loaded: \(joke?.setup ?? "nil")")
        }catch{
            print("Error: \(error)")
            errorMessage = "failed to load joke"
        }
        
        isLoading = false
    }
}
