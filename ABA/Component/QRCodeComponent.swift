import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct QRCodeComponent: View {
    var qr = Text("QR")
        .fontWeight(.bold)
    var xclusionmark = Image(systemName: "info.circle")
    
    @Environment(\.dismiss) private var dismiss
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage{
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
    }
    

    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black).ignoresSafeArea()
                VStack{
                    HStack{
                        Text("ប្រើ \(qr) នេះ ដើម្បីទទួលប្រាក់មិត្តភក្តិ ឬ ផ្ទេរប្រាក់ពីរអេបធនាគារផ្សេងរបស់នាក់ \(xclusionmark)")
                            .foregroundStyle(.white)
                            .lineSpacing(10)
                            .font(.title2)
                            .padding(.horizontal,30)
                            .multilineTextAlignment(.center)
                        
                    }
                    HStack{
                        GeometryReader{ geometry in
                            let side = geometry.size.width
                            ZStack{
                                VStack(alignment: .center){
                                    Image("KHQR")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: side)
                                }
                                .frame(maxWidth: .infinity)
                                VStack(alignment: .leading){
                                    Group{
                                        Text("Y Meng Sea")
                                        Text("$0.00")
                                    }
                                    .textCase(.uppercase)
                                    .font(.title2)
                                    .bold()
                                }.offset(x:-50 ,y: -110)
                                Image(uiImage: generateQRCode(from: "00020101021130450016abaakhppxxx@abaa01090127327620208ABA Bank40390006abaP2P011261A13E11577102090127327625204000053031165802KH5909Y MENGSEA6010Phnom Penh63047DAA"))
                                    .interpolation(.none)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200,height: 200)
                                    .offset(y: 70)
                            }
                        }
                    }
                    Button{
                        //
                    } label: {
                        HStack{
                            Image(systemName: "plus.circle")
                            .font(.title)
                            Text("បញ្ជូលចំនួួនទឹកប្រាក់")
                        }
                        .foregroundStyle(.cyan)
                        .padding(EdgeInsets(top: 5, leading: 50, bottom: 5, trailing: 50))
                        .background(Color(.gray).opacity(0.2))
                        .cornerRadius(8)
                        .padding(.bottom)
                    }
                    HStack{
                        Text("ទទួលទៅ:")
                            .foregroundStyle(.white)
                        Text("002 4902 299 | USD")
                            .foregroundStyle(.cyan)
                    }
                    HStack{
                        Group{
                            Image(systemName: "square.and.arrow.down")
                            Image(systemName: "dot.circle.viewfinder")
                            Image(systemName: "link")
                        }.font(.title2)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color(.gray).opacity(0.2))
                            .cornerRadius(50)
                            .padding()

                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    HStack{
                        Image("ABALogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        Text("QR")
                            .foregroundStyle(.white)
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color(.gray).opacity(0.2))
                            .cornerRadius(50)
                    }
                }
            }
            
        }
    }
}

#Preview {
    QRCodeComponent()
}
