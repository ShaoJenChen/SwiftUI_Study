//
//  CardView.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/6.
//

import SwiftUI

struct CardView: View {
    
    var imageName: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.leading)
                Spacer()
            }
            
        }
        .cornerRadius(10)
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(white: 0,opacity: 0.1), lineWidth: 1)
                .padding(.horizontal)
            
        )
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("Your Reading")
                    .font(.largeTitle)
                
                CardView(imageName: "swiftui-button",
                         category: "SwiftUI",
                         heading: "Drawing a Border with Rounded Corners",
                         author: "Simon Ng")
                CardView(imageName: "flutter-app",
                         category: "SwiftUI",
                         heading: "Drawing a Border with Rounded Corners",
                         author: "Simon Ng")
                CardView(imageName: "macos-programming",
                         category: "SwiftUI",
                         heading: "Drawing a Border with Rounded Corners",
                         author: "Simon Ng")
                CardView(imageName: "natural-language-api",
                         category: "SwiftUI",
                         heading: "Drawing a Border with Rounded Corners",
                         author: "Simon Ng")
            })
            .padding(.top)
        })
        
    }
}
