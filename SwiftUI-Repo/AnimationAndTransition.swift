//
//  AnimationAndTransition.swift
//  SwiftUI-Repo
//
//  Created by ShaoJen Chen on 2020/12/7.
//

import SwiftUI

struct AnimationAndTransition: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    @State private var animate = false
    @State private var animate2 = false
    
    var body: some View {
        
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .animation(.default)
        .onTapGesture {
            self.circleColorChanged.toggle()
            self.heartColorChanged.toggle()
            self.heartSizeChanged.toggle()
        }
        
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 10)
                .frame(width: 100, height: 100, alignment: .center)
            Circle()
                .trim(from: 0.0, to: 0.2)
                .stroke(Color.green, lineWidth: 8)
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(animate ? .degrees(360) : .zero)
        }
        .animation(
            Animation.linear(duration: 1.0).repeatForever(autoreverses: false)
        )
        .onAppear(perform: {
            animate.toggle()
        })
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0,
                             style: .continuous)
                .frame(width: 250, height: 10)
                .foregroundColor(.gray)
            HStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 30, height: 10)
                    .foregroundColor(.green)
                    .offset(x: animate ? 110 : -110, y: 0)
            }
        }
        .animation(
            Animation.linear(duration: 1.0).repeatForever(autoreverses: false)
        )
        .onAppear(perform: {
            self.animate.toggle()
        })
        
        
        HStack {
            ForEach(0 ... 4, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(.green)
                    .scaleEffect(animate ? 1 : 0)
                    .animation(
                        Animation
                            .linear(duration: 1.0)
                            .repeatForever()
                            .delay(Double(index) * 0.2)
                            
                    )
                    .onAppear(perform: {
                        self.animate.toggle()
                    })
            }
            
        }
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: animate ? 50 : 250, height: 50, alignment: .center)
            .foregroundColor(animate ? .red : .green)
            .overlay(
                Image(systemName: "mic.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .scaleEffect(animate2 ? 0.7 : 1.0)
            )
            .onTapGesture {
                
                withAnimation {
                    self.animate.toggle()
                }
                withAnimation(Animation
                                .spring()
                                .repeatForever()) {
                    self.animate2.toggle()
                }
                
            }
            
        
        ZStack {
            
            RoundedRectangle(cornerRadius: animate ? 30 : 5)
                .frame(width: animate ? 60 : 250, height: 60)
                .foregroundColor(animate ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .scaleEffect(animate2 ? 0.7 : 1)
                )
            
//            RoundedRectangle(cornerRadius: animate ? 35 : 10)
//                .trim(from: 0, to: animate ? 0 : 1)
//                .stroke(lineWidth: 5)
//                .frame(width: animate ? 70 : 260, height: 70)
//                .foregroundColor(.green)
            
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                self.animate.toggle()
            }
            
            withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                self.animate2.toggle()
            }
        }
    
    
    }
}


struct AnimationAndTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnimationAndTransition()
    }
}
