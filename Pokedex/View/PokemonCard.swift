import SwiftUI
import Kingfisher

struct PokemonCard: View {
    let viewModel: PokemonViewModel
    let pokemon: Pokemon
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.getBackgroundColor(forType: pokemon.types?.first?.type.name ?? ""))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(pokemon.name?.capitalized ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading)
                    
                    Text(formattedId)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading, 2)
                }
                
                HStack {
                    Text(pokemon.types?.first?.type.name.capitalized ?? "")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.sprites?.frontDefault ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding([.bottom, .trailing], 8)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 4, x: 1.0, y: 1.0)
    }
    
    var formattedId: String {
        guard let id = pokemon.id else { return ""}
        if id / 10 < 1 {
            return "#00\(id)"
        } else if id / 10 < 10 {
            return "#0\(id)"
        } else {
            return "#\(id)"
        }
    }
}
