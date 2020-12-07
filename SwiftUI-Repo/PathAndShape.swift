//
//  PathAndShape.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/6.
//

import SwiftUI

struct PathAndShape: View {
    
    @State var lineWidth: Double = 20.0
    
    @State private var percent: Double = 0.75
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Path({ path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.closeSubpath()
        }).stroke()
        
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
                .font(.title)
                .foregroundColor(.white)
        })
        .background(ShapeDemo().fill(Color.green))
        
        Circle()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.green)
            .overlay(
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
            )
        
        Circle()
            .foregroundColor(.gray)
            .overlay(
                GeometryReader(content: { geometry in
                    Circle()
                        .trim(from: 0.0, to: 1.0)
                        .frame(width: self.getSize(geometry).width - 2 * CGFloat(lineWidth),
                               height: self.getSize(geometry).height - 2 * CGFloat(lineWidth),
                               alignment: .center)
                        .offset(x: CGFloat(lineWidth), y: CGFloat(lineWidth))
                })
            )
            .foregroundColor(.orange)
            .overlay(
                Donut(percent: $percent, lineWidth: lineWidth)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [Color("LightGreen"), Color("DarkGreen")]),
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(353))
                        ,
                        style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round))
                
            )
            .rotationEffect(.degrees(-90))
            .overlay(
                Text(String(format: "%.1f %% ", percent * 100))
                    .font(.largeTitle)
                    .foregroundColor(.white)
            )
            .onReceive(timer, perform: { _ in
                withAnimation {
                    guard self.percent < 1 else {
                        
                        self.timer.upstream.connect().cancel()
                        return
                        
                    }
                    self.percent += 0.01
                }
            })
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 10)
            Circle()
                .trim(from: 0.0, to: 0.85)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center)
//                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    , lineWidth: 10)
        }
        
    }
    
    func getSize(_ geometry: GeometryProxy) -> CGSize {
        
        return CGSize(width: geometry.size.width, height: geometry.size.height)
        
    }
}
struct Donut: Shape {
    
    @Binding var percent: Double
    @State var lineWidth: Double
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.minX + rect.midX,
                             y: rect.minY + rect.midY)
        let radius = rect.maxX - rect.midX - (CGFloat(lineWidth) / 2)
        
        let path = Path({ path in
            path.addArc(center: center,
                        radius: radius,
                        startAngle: Angle(radians: 0),
                        endAngle: Angle(degrees: percent * 360),
                        clockwise: false)
        })
            
        return path
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
