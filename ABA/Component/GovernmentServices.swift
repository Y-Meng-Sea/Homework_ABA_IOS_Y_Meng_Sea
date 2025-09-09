import Foundation
import SwiftUI

struct GovernmentServices: View {
    var services = [
        Service(serviceName: "U&Me Spa Massage", serviceImage: "foreigner"),
        Service(serviceName: "Metfone Service", serviceImage: "general"),
        Service(serviceName: "VET Express", serviceImage: "NSSF"),
        Service(serviceName: "Manu Life Service", serviceImage: "PPSHV"),
        Service(serviceName: "Cambo Ticket", serviceImage: "publicWork"),
    ]
    var body: some View {
        let side = UIScreen.main.bounds.width / 5
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(services) { service in
                    VStack {
                        Image(service.serviceImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: side, height: side)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: side * 0.3,
                                    style: .continuous
                                )
                            )
                            .overlay {
                                RoundedRectangle(
                                    cornerRadius: side * 0.3,
                                    style: .continuous
                                ).stroke(Color.white, lineWidth: 3)
                            }
                        Text(service.serviceName)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(width: side)
                    }
                }
            }
            
        }.scrollIndicators(.hidden)
            .padding(.vertical)
            .padding(.leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
    }
}

#Preview {
    GovernmentServices()
    //    ContentView()
}
