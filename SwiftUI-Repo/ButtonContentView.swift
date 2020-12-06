//
//  ButtonContentView.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/6.
//

import SwiftUI

struct ButtonContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Hello Button")
            }, label: {
                Text("First Button")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .border(Color.green, width: 0.1)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.green, lineWidth: 5)
                    )
                    
                    
                    
            })
            
            Button(action: {
                print("Hello Button")
            }, label: {
                Image(systemName: "trash")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .border(Color.primary, width: 0.1)
                    .background(Color.secondary)
                    .cornerRadius(40)
                    .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.primary, lineWidth: 5)
                    )
                    
                    
                    
            })
            
            Button(action: {
                print("Hello Button")
            }, label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
                .font(.title)
                .foregroundColor(.primary)
                .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .border(Color.primary, width: 0.1)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .cornerRadius(40)
                .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/), lineWidth: 5)
                )
                    
            })
            
            Button(action: {
                print("Hello Button")
            }, label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
                .font(.title)
                .foregroundColor(.primary)
                .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .border(Color.primary, width: 0.1)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .cornerRadius(40)
                .shadow(color: Color("DarkGreen"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/), lineWidth: 5)
                )
                    
            })
            
            Button(action: {
                print("Hello Button")
            }, label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
                .frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.title)
                .foregroundColor(.primary)
                .padding()
                .border(Color.primary, width: 0.1)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .cornerRadius(40)
                .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .shadow(color: Color("DarkGreen"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/), lineWidth: 2)
                )
                .padding(.horizontal, 20)
                    
            })
            
            Button(action: {
                print("Costom Btn Style")
            }, label: {
                HStack {
                    Image(systemName: "person")
                    Text("Add")
                }
            })
            .buttonStyle(gradientButtonStyle())
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus")
            })
            .buttonStyle(rotationEffectStyle())
            
        }
        
    }
}


struct gradientButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .foregroundColor(.yellow)
            .padding()
            .border(Color.primary, width: 0.1)
            .background(
                LinearGradient(gradient:
                                Gradient(colors:[Color("LightGreen"),Color("DarkGreen")]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing))
            .cornerRadius(40)
            .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .shadow(color: Color("DarkGreen"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(
                        LinearGradient(gradient:
                                        Gradient(colors:[Color("LightGreen"),Color("DarkGreen")]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),
                        lineWidth: 2)
            )
            .padding(.horizontal, 50)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
        
    }
    
}

struct rotationEffectStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundColor(.white)
            .padding(10)
            .background(Color.purple)
            .cornerRadius(50)
            .rotationEffect(configuration.isPressed ? .degrees(45) : .zero)
    }
}

struct ButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonContentView()
    }
}
