import SwiftUI
import Foundation
import PhotosUI

struct ThemeComponent: View {
    var buttons = ["Themes", "Dark Mode", "Homescreen", "Profile"]
    var themes = [
        Theme(themeName: "Bon Teay Srey", themeImage: "BonTeaySrey"),
        Theme(themeName: "Bayon", themeImage: "Bayon"),
        Theme(themeName: "Angkor Wat", themeImage: "AngkorWat"),
        Theme(themeName: "Cute Pets", themeImage: "Cute Pets"),
        Theme(themeName: "Khmer Heritage", themeImage: "Khmer Heritage"),
        Theme(themeName: "Moon Night", themeImage: "Moon Night"), Theme(themeName: "Sunset", themeImage: "Sunset"),
        Theme(themeName: "Train", themeImage: "Train")
        
    ]
    @Binding var mytheme: String
    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var selectImage: Image?
    @Binding var customImage: Image?
    
    var body: some View {
        VStack{
            Text("Appearance")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity ,alignment: .leading)
            ScrollView(.horizontal){
                HStack{
                    ForEach(buttons, id: \.self){button in
                        Button{
                            
                        }label: {
                            Text(button)
                                .padding()
                                .font(.headline)
                                .background(.white)
                                .foregroundStyle(Color(.gray))
                                .cornerRadius(50)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            // theme choice
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    ForEach(themes){theme in
                        let isSelected = (mytheme == theme.themeImage)
                        Button{
                            mytheme = theme.themeImage
                        }label: {
                            VStack{
                                Image(theme.themeImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 200)
                                    .cornerRadius(20)
                                    .overlay {
                                        RoundedRectangle(
                                            cornerRadius: 20,
                                            style: .continuous
                                        ).stroke(isSelected ? .blue : .white, lineWidth: 8)
                                    }
                                Text(theme.themeName)
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                            if let image = selectImage {
                                VStack{
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 200)
                                        .cornerRadius(20)
                                        .overlay {
                                            RoundedRectangle(
                                                cornerRadius: 20,
                                                style: .continuous
                                            ).stroke(.white, lineWidth: 8)
                                        }
                                    Text("Custom theme")
                                        .font(.title2)
                                        .foregroundStyle(.gray)
                                }
                            } else {
                                VStack{
                                    Text("")
                                        .frame(width: 140, height: 200)
                                        .cornerRadius(20)
                                        .overlay {
                                            RoundedRectangle(
                                                cornerRadius: 20,
                                                style: .continuous
                                            ).stroke(.white, lineWidth: 8)
                                        }
                                    HStack{
                                        Text("Choose")
                                            .font(.title2)
                                            .foregroundStyle(.gray)
                                        Image(systemName: "photo.badge.magnifyingglass")
                                        .onChange(of: selectedPhotoItem) { oldValue, newValue in
                                            Task {
                                                if let data = try? await newValue?.loadTransferable(type: Data.self ){
                                                    if let uiImage = UIImage(data: data) {
                                                        selectImage = Image(uiImage: uiImage)
                                                    }
                                                }
                                                
                                            }
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(.white)
                                    .cornerRadius(7)
                                    
                                }
                            }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.lightGray).opacity(0.1))
    }
}

#Preview {
    ThemeComponent(mytheme: .constant("BonTeaySrey"))
}

