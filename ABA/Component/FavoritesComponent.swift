import SwiftUI
import Foundation

struct FavoritesComponent: View {
    var favorites = ["Shoko", "Yuji", "Gojo", "Sota", "Hori" , "Miya"]
    var colors: [Color] = [.cyan, .pink, .purple, .orange ]
    var body: some View {
            let side = UIScreen.main.bounds.width / 3.5
            ScrollView(.horizontal){
                HStack{
                    ForEach(favorites, id: \.self) {favorite in
                        VStack{
                            Text("S")
                                .frame(width: side / 3 , height: side / 3 )
                                .background(colors.randomElement())
                                .cornerRadius(50)
                                .overlay {
                                    Circle().stroke(Color.gray, lineWidth: 2)
                                }
                            Text(favorite)
                                .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .topLeading)
                        .padding()
                    }
                    .frame(width: side, height: side + side / 5 )
                    .background(.white)
                    .cornerRadius(side / 5)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical)
            .padding(.leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
    }
}

#Preview {
//    Favorites()
    ContentView()
}
