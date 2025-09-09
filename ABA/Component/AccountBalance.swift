import Foundation
import SwiftUI

struct AccountBalance: View {
    @State private var accountSelect = "default"
    @State private var isShowBalance = false
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("$100000.00")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                    .blur(radius: isShowBalance ? 0 : 5)
                    .animation(.easeInOut(duration: 0.2), value: isShowBalance)
                Button {
                    isShowBalance.toggle()
                } label: {
                    Image(systemName: isShowBalance ? "eye.slash" : "eye" )
                        .frame(width: 30, height: 30)
                        .bold()
                        .padding(EdgeInsets(top: 4, leading: 3, bottom: 4, trailing: 3))
                        .foregroundStyle(.white)
                        .background(.cyan)
                        .cornerRadius(5)
                }
            }
            HStack(spacing:10) {
                Group {
                    Button("Default") {
                        accountSelect = "default"
                    }
                    .padding(5)
                    .background( accountSelect == "default" ? .cyan : .clear)
                    Button("Saving") {
                        accountSelect = "saving"
                    }
                    .padding(5)
                    .background( accountSelect == "saving" ? .cyan : .clear)
                }
                .foregroundStyle(.white)
                .cornerRadius(6)
            }.padding(.bottom,50)
            
            HStack(spacing: 30) {
                HStack {
                    Image("receive-circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text("Recieve money")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .bold()
                }
                HStack {
                    Image("send-circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text("Recieve money")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .bold()
                }
            }  .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

#Preview {
    //    AccountBalance()
    ContentView()
}
