import SwiftUI

struct OptionsComponent: View {
    var options = [
        Service(serviceName: "Account", serviceImage: "wallet"),
        Service(serviceName: "Pay bills", serviceImage: "bill"),
        Service(serviceName: "Transfer", serviceImage: "transericon"),
        Service(serviceName: "Favorites", serviceImage: "favorite"),
        Service(serviceName: "ABA Scan", serviceImage: "scan-fill"),
        Service(serviceName: "Service", serviceImage: "service"),
    ]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(options, id: \.serviceName) { option in
                GeometryReader { geo in
                    VStack {
                        Image(option.serviceImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width / 2, height: geo.size.width / 2 )
                        Text(option.serviceName)
                    }
                    .frame(width: geo.size.width, height: geo.size.width)
                    .background(.white)
                    .cornerRadius(geo.size.width * 0.2)
                }
                .aspectRatio(1, contentMode: .fit)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

#Preview {
    OptionsComponent()
}
