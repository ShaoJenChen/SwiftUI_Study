//
//  ContentView.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/5.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            
            VStack {
                PricingView(title: "Basic",
                            price: "$9",
                            textColor: .white,
                            bgColor: .purple,
                            icon: "person")
                Spacer()
            }
            VStack {
                PricingView(title: "Pro",
                            price: "$49",
                            textColor: .white,
                            bgColor: .gray,
                            icon: "person.2")
                Spacer()
            }
            .offset(x: 0, y: 100)
            VStack {
                PricingView(title: "Team",
                            price: "$199",
                            textColor: .white,
                            bgColor: .blue,
                            icon: "person.3")
                Spacer()
            }
            .offset(x: 0, y: 200)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct headerView: View {
    var body: some View {
        HStack {
            Text("Choose Plan")
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            
            icon.map({
                Image(systemName: $0)
            })
            .font(.largeTitle)
            .foregroundColor(textColor)
            .padding(.top, 20)
            
            Text(title)
                .font(.title)
                .foregroundColor(textColor)
                .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text(price)
                .foregroundColor(textColor)
                .font(.system(size: 30, weight: .heavy, design: .monospaced))
            Text("per month")
                .font(.body)
                .foregroundColor(textColor)
                .padding(.bottom, 10)
            Spacer()
            
        })
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 300)
        .background(bgColor)
        .cornerRadius(20)
        .padding(.all, 10)
        
    }
}
