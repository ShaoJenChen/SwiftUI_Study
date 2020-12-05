//
//  ContentView.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/5.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(alignment: .center, spacing: nil, content: {
            headerView()
            PricingView()
            Spacer()
        })
        
//        VStack {
//            Text("Hello, world!")
//                .font(.title)
//                .multilineTextAlignment(.leading)
//                .lineLimit(0)
//                .padding(.all, 0.0)
////                .rotation3DEffect(
////                    .degrees(60),
////                    axis: (x: 0, y: 1, z: 0))
//                .rotation3DEffect(
//                    .degrees(60),
//                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
//                    anchor: .center,
//                    anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
//                    perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
//                )
//                .shadow(color: .orange, radius: 2, x: 6, y: 2)
//                .padding(.bottom, 200)
//            Image(systemName: "person.crop.circle.badge.plus")
//                .font(.system(size: 100))
//                .padding(.top, 200)
//                .foregroundColor(.purple)
//                .colorInvert()
//                .shadow(color: .orange, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
//            Image("splash")
//                .resizable()
//                .edgesIgnoringSafeArea(.top)
//                .edgesIgnoringSafeArea(.bottom)
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 300)
////                .clipShape(RoundedRectangle(cornerRadius: 150.0))
//                .clipShape(Circle())
//                .opacity(1)
//                .overlay(
//                    Text("Hello, world!")
//                        .font(.title)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .padding(.all, 0.0)
//                        .rotation3DEffect(
//                            .degrees(60),
//                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
//                            anchor: .center,
//                            anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
//                            perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
//                        )
//                    ,alignment: .leading
//                )
//                .overlay(
//                    Image(systemName: "person.crop.circle.badge.plus")
//                        .font(.system(size: 100))
//                        .rotation3DEffect(
//                            .degrees(-60),
//                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.purple)
//                        .colorInvert()
//                        .shadow(color: .orange, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
//                        .overlay(
//                            Text("123")
//                            ,alignment: .topLeading
//                        )
//                    ,alignment: .trailing
//                )
//                .overlay(
//                    Circle()
//                        .foregroundColor(.red)
//                        .aspectRatio(contentMode: .fit)
//                        .clipped()
//                        .opacity(0.3)
//                )
//
//        }
        
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

struct caseBasicView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 1, content: {
            
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
            
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(.all, 10)
        .background(bgColor)
        .cornerRadius(10)
    }
}
struct caseProView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 1, content: {
            
            icon.map({
                Image(systemName: $0)
            })
            .font(.largeTitle)
            .foregroundColor(textColor)
            
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
            
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(.all, 10)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct PricingView: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .center, spacing: 10, content: {
                caseBasicView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                ZStack {
                    caseProView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .offset(x: 0, y: 65)
                }
            })
            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            ZStack {
                caseProView(title: "Team", price: "$299", textColor: .white, bgColor: Color.gray, icon: "wand.and.rays")
                    .padding([.leading, .trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("Perfect for teams")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .offset(x: 0, y: 90)
            }
        }
        
    }
}
