//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Calin Rafa on 30.03.2023.
//
import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: baseURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .orange
        case "poison": return .green
        case "water": return .blue
        default: return  .red
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        
        return data
    }
}
