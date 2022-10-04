//
//  ModelSheetView.swift
//  travelbookingAPP
//
//  Created by Jonathan Lewter on 9/30/22.
//

import SwiftUI
struct ModalSheetView: View {
    
    @Binding var place: String
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.spring()){
                    show.toggle()
                }
            }){
                Image(systemName: "xmark")
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text(place)
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .font(.system(size: 60))
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10)
            {
                HStack{
                    Text(details[place]?.title ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    
                    Spacer()
                    
                    Text(details[place]?.price ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                
                Text("\(details[place]?.rating ?? "")/5")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text(details[place]?.description ?? "")
                    .foregroundColor(.white)
                    .lineLimit(3)
                
                Button(action: {
                    
                }){
                    HStack{
                        Spacer()
                        Text("BOOK NOW")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color("primary"))
                .buttonStyle(PlainButtonStyle())
                .clipShape(RoundedRectangle(cornerRadius: 40))
            }
            .padding(.horizontal, 30)
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(
            Image(place)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct Details: Identifiable {
    var id = UUID()
    var title: String
    var price: String
    var rating: String
    var description: String
}

var details = [

    "JAPAN" : Details(title: "Tokyo Trip", price: "$ 450", rating: "4.5", description: "Book this exhilirating trip to Tokyo so you can explore all the wonderful things the city has to offer!"),
    "NYC" : Details(title: "New York Trip", price: "$ 168", rating: "4.5", description: "Explore the Big Apple, experience the night life of Times Square, fall victim to its delicious food options"),
    "LONDON" : Details(title: "London Trip", price: "$ 719", rating: "4.5", description: "Explore the wonderful sightseeing that London and the wonderful buildings that are scattered all over")

]
