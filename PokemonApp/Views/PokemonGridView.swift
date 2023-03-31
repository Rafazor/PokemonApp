//
//  PokemonGridView.swift
//  PokemonApp
//
//  Created by Calin Rafa on 30.03.2023.
//

import SwiftUI

struct PokemonGridView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(viewModel.pokemon) { pokemon in
                            NavigationLink {
                                PokemonDetailsView(viewModel: viewModel, pokemon: pokemon)
                            } label: {
                                PokeCellView(pokemon: pokemon, viewModel: viewModel)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Pokemon Club")
    }
}

struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}
