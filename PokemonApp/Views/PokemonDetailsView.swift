//
//  PokemonDetailsView.swift
//  PokemonApp
//
//  Created by Calin Rafa on 30.03.2023.
//

import SwiftUI


let sampleNPoke = Pokemon(id: 1, name: "Test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 23, height: 32, attack: 32, defense: 32, description: "TEst")

let sampleNVM = PokemonViewModel()

struct PokemonDetailsView: View {
    let viewModel: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.name)
        Text(pokemon.type)
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(viewModel: sampleNVM, pokemon: sampleNPoke)
    }
}
