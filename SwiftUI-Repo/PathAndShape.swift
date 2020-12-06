//
//  PathAndShape.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/6.
//

import SwiftUI

struct PathAndShape: View {
    var body: some View {
//        Path({ path in
//
//            path.move(to: CGPoint(x: 20, y: 20))
//            path.addLine(to: CGPoint(x: 300, y: 20))
//            path.addLine(to: CGPoint(x: 300, y: 200))
//            path.addLine(to: CGPoint(x: 20, y: 200))
//            path.closeSubpath()
//        }).stroke()
        ZStack {
            Path({ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: CGPoint(x: 200, y: 200),
                            radius: 150.0,
                            startAngle: Angle(radians: 0),
                            endAngle: Angle(radians: -.pi / 2),
                            clockwise: true)
            })
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Path({ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: CGPoint(x: 200, y: 200),
                            radius: 150.0,
                            startAngle: Angle(radians: -.pi / 2),
                            endAngle: Angle(radians: -.pi * 5/4),
                            clockwise: true)
            })
            .foregroundColor(.gray)
            
            Path({ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: CGPoint(x: 200, y: 200),
                            radius: 150.0,
                            startAngle: Angle(radians: -.pi * 5/4),
                            endAngle: Angle(radians: 0),
                            clockwise: true)
            })
            .foregroundColor(.green)
            .offset(x: 5, y: 5)
            
            Path({ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: CGPoint(x: 200, y: 200),
                            radius: 150.0,
                            startAngle: Angle(radians: -.pi * 5/4),
                            endAngle: Angle(radians: 0),
                            clockwise: true)
                path.closeSubpath()
                path.move(to: CGPoint(x: 200, y: 200))
            })
            .stroke()
            .offset(x: 5, y: 5)
            .overlay(
                Text("40%")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .offset(x: 40, y: -90)
            )
            
        }
        
        ShapeDemo()
            .path(in: CGRect(x: 100,
                             y: 200,
                             width: 100,
                             height: 100))
            .stroke(Color.red, lineWidth: 2)
        
        Button(action: {
            
        }, label: {
            Text("ShapeButton")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        })
        .background(ShapeDemo().fill(Color.green))
    }
}

struct ShapeDemo: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = Path() { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: rect.minX + rect.width,
                                          y: rect.minY),
                              control: CGPoint(x: (rect.minX + rect.maxX)/2,
                                               y: rect.minY - rect.height/5))
            path.addRect(CGRect(x: rect.minX,
                                y: rect.minY,
                                width: rect.width,
                                height: rect.height))
        }
        return path
    }
}

struct PathAndShape_Previews: PreviewProvider {
    static var previews: some View {
        PathAndShape()
    }
}
