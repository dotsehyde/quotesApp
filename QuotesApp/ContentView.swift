//
//  ContentView.swift
//  QuotesApp
//
//  Created by Benjamin on 04/04/2022.
//

import SwiftUI

struct ContentView: View {
    let quotes:[Quote] = quoteData
    //    [Quote(quote: "This is a quote", name: "James"),Quote(quote: "This is a quote", name: "James"),Quote(quote: "This is a quote", name: "James")]
    var body: some View {
        VStack{
            Image("lilly")
                .resizable().frame(width: 160, height: 160, alignment: .center)
                .clipShape(Circle()).overlay(Circle().stroke(Color.gray,lineWidth: 3)).padding(.bottom,10)
            
            Text("\(quotes.count) Quotes Available")
                .font(.headline)
                .foregroundColor(.white)
                .italic()
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{  ForEach(quotes, id: \.self){ i in
                    QuoteCard(quote: i.quote,author: i.name).padding(5)
                    
                }.padding(.bottom)
                }
            }
        }.background(Image("motivation_bg")).ignoresSafeArea()
    }
}

struct QuoteCard:View{
    var quote:String
    var author:String
    var body: some View{
        VStack {
            Image("lilly")
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray,lineWidth: 2))
                .shadow(radius: 10)
                .frame(width: 100, height: 100, alignment: .center)
            
            Text(#""\#(quote)""#)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Divider()
            Text("By - \(author)")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .italic()
        }.frame(width: 300, height: 300)
        
            .background(Color.white)
            .cornerRadius(15)
            .overlay(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [.clear,.teal]), startPoint: .center, endPoint: .bottom))  .clipped()
                .shadow(radius: 8))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
