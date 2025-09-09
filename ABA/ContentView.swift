import SwiftUI

struct ContentView: View {
    @State private var isShowTheme = false
    @State var choosenTheme: String = "BonTeaySrey"
    @State var customTheme: Image?
    var body: some View {
            ZStack{
                // background Image
                Image(choosenTheme)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    // profile section
                    ProfileComponent()
                    
                    ScrollView{
                        VStack(spacing: 40){
                            // account balance section
                            AccountBalance()
                            
                            // options
                            OptionsComponent()
                                .highPriorityGesture(
                                    LongPressGesture(minimumDuration: 0.5)
                                        .onEnded { _ in
                                            
                                        }
                                )

                            
                            // slide section
                            VStack{
                                VStack(alignment: .leading){
                                    Text("New and Information")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                        .bold()
                                    BannerSlide()
                                        .frame(height: 220)
                                }
                                
                                // favorite
                                VStack(alignment: .leading){
                                    Text("Favorite")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                        .bold()
                                    FavoritesComponent()
                                }
                                
                                // Explore Service
                                VStack(alignment: .leading){
                                    Text("Explore Services")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                        .bold()
                                    ExploreServicesComponent()
                                }
                                
                                // government Service
                                VStack(alignment: .leading){
                                    Text("Government Service")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                        .bold()
                                    GovernmentServices()
                                }
                            }
                            // edit theme
                            Button{
                                isShowTheme.toggle()
                            } label: {
                                HStack{
                                    Image(systemName: "highlighter")
                                    Text("Edit Home")
                                }
                                .padding(EdgeInsets(
                                    top: 5,
                                    leading: 20,
                                    bottom: 5,
                                    trailing: 20)
                                )
                                .background(.white)
                                .cornerRadius(50)
                                .foregroundStyle(Color(.gray).opacity(0.7))
                            }.sheet(isPresented: $isShowTheme) {
                                ThemeComponent(mytheme: $choosenTheme)
                                    .presentationDetents([.medium, .large])
                            }
                            
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal)
                    .onLongPressGesture(minimumDuration: 0.5) {
                        isShowTheme = true
                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}
