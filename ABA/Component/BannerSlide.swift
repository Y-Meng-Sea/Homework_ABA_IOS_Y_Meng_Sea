import SwiftUI
import Foundation

struct BannerSlide: View {
    @State private var currentIndex: Int = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    var slides = ["ABA_Promote2", "ABA_Promote3", "ABA-promote_EON"]
    var body: some View {
        TabView(selection: $currentIndex){
            ForEach(0..<slides.count, id: \.self ){ index in
                Image(slides[index])
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(40)
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % slides.count
            }
        }
        
    }
}

#Preview {
    ContentView()
}
