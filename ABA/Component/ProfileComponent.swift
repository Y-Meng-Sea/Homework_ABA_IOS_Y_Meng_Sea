import Foundation
import SwiftUI

struct ProfileComponent: View {
    @State private var isOpenQr = false

    var body: some View {
        HStack {
            //profile
            HStack {
                Image("profileImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .cornerRadius(50)
                VStack(alignment: .leading) {
                    Group {
                        Text("Hello, Meng Sea!")
                            .bold()
                        Text("View Profile")
                            .opacity(0.7)
                    }
                    .foregroundStyle(Color(.white))
                }
            }
            Spacer()
            // notification and QRCode
            HStack {
                Group {
                    // notification button
                    Button {
                        // action
                    } label: {
                        Image("notificatioIcon")
                            .resizable()
                    }

                    // QR code Button
                    Button {
                        isOpenQr.toggle()
                    } label: {
                        Image("IconGoToQR")
                            .resizable()
                    }.fullScreenCover(isPresented: $isOpenQr) {
                        QRCodeComponent()
                    }
                }
                .scaledToFit()
                .frame(width: 30)
            }

        }.padding(.horizontal)
    }
}

#Preview {
    //    ProfileComponent()
    ContentView()
}
