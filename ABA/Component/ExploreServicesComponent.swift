import Foundation
import SwiftUI

struct ExploreServicesComponent: View {
    var services = [
        Service(serviceName: "U&Me Spa Massage", serviceImage: "U&Me"),
        Service(serviceName: "Metfone Service", serviceImage: "metfonelogo"),
        Service(serviceName: "VET Express", serviceImage: "VET"),
        Service(serviceName: "Manu Life Service", serviceImage: "manulife"),
        Service(serviceName: "Cambo Ticket", serviceImage: "comboticket"),
        Service(serviceName: "Cambo Link Service", serviceImage: "cambolink"),
    ]

    var body: some View {
        let side = UIScreen.main.bounds.width / 5

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(services) { service in
                    VStack(spacing: 8) {
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
                                )
                                .stroke(Color.white, lineWidth: 2)
                            }
                        Text(service.serviceName)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(width: side)
                    }
                    
                }
            }
            .padding(.vertical, 12)
            .padding(.leading)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

#Preview {
    //    ExploreServices()
    ContentView()
}
