//
//  StateView.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/6.
//

import SwiftUI

struct StateView: View {
    
    @State private var isPlaying = true
    @State private var totalCount = 0
    
    var body: some View {
        VStack {
            Button(action: {
                
                isPlaying.toggle()
                
            }, label: {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(isPlaying ? .red : .green)
            })
            
            Text("\(totalCount)")
            
            CircleCountView(color: .red, totalCount: $totalCount)
            CircleCountView(color: .blue, totalCount: $totalCount)
            CircleCountView(color: .green, totalCount: $totalCount)
            
        }
        
    }
}

struct CircleCountView: View {
    
    var color: Color
    
    @Binding var totalCount: Int
    
    @State private var count = 0
    
    var body: some View {
        Button(action: {
            count += 1
            totalCount += 1
        }, label: {
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(color)
                .overlay(
                    Text("\(self.count)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                )
        })
        
    }
    
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
