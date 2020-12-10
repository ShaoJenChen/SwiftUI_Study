//
//  Transition.swift
//  SwiftUI-Repo
//
//  Created by ShaoJen Chen on 2020/12/9.
//

import SwiftUI

struct Transition: View {
    
    @State private var show = false

    @State private var loading = false
    
    @State private var completed = false
    
    @State private var btnText = "Submit"
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)

                )
                .onTapGesture {
                    withAnimation(Animation.spring()) {

                        self.show.toggle()

                    }
                }
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                    .transition(
//                        .scale(scale: 0, anchor: .bottom)
//                        .offset(x: -600, y: 0)
//                        AnyTransition.offset(x: -600, y: 0)
//                            .combined(with: .scale)
//                            .combined(with: .opacity)
//                        AnyTransition.offsetScaleOpacity
                        .scaleAndOffset
                    )
            }

        }
        
        
        Circle()
            .trim(from: 0, to: 0.9)
            .stroke(Color.black, lineWidth: 3)
            .frame(width: 30, height: 30)
            .rotationEffect(loading ? .degrees(360) : .zero)
            .animation(Animation.easeOut.repeatForever(autoreverses: false))
            .onAppear(perform: {
                self.loading.toggle()
            })
        
    }

}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0)
            .combined(with: .scale)
            .combined(with: .opacity)
    }
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion:
                                    .scale(scale: 0,
                                           anchor: .bottom),
                                 removal:  .offsetScaleOpacity)
        
    }
}



struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
