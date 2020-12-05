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
        VStack {
            Text("Choose Plan")
        }
    }
}

struct caseBasicView: View {
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 1, content: {
            
            Text("Basic")
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("$9")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .heavy, design: .monospaced))
            Text("per month")
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(.all, 10)
        .background(Color.purple)
        .cornerRadius(10)
    }
}
struct caseProView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 1, content: {
            
            Text("Preminun")
                .font(.title)
                .foregroundColor(.black)
                .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("$19")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy, design: .monospaced))
            Text("per month")
                .font(.body)
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(.all, 10)
        .background(Color(red: 240/255, green: 240/255, blue: 240/255))
        .cornerRadius(10)
    }
}

struct PricingView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 5, content: {
            caseBasicView()
            caseProView()
        })
        .padding([.leading, .trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
