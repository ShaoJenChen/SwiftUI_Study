//
//  Navigation.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/12.
//

import SwiftUI

struct Navigation: View {
    
    init() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
//
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
//        navBarAppearance
//            .setBackIndicatorImage(
//                UIImage(systemName: "arrow.turn.up.left"),
//                transitionMaskImage:
//                    UIImage(systemName: "arrow.turn.up.left"))
//        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
        
        //        NavigationView(content: {
        //            NavigationLink(destination:
        //                List_ForEach_Identify()
        //                ) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
//        })
        
        NavigationView {
            
            List {
//                ForEach(restaurants) { restaurant in
//
//                    NavigationLink(
//                        destination: RestaurantDetailView(restaurant: restaurant),
//                        label: {
//                            FullImageRow(restaurant: restaurant)
//                        })
//
////                    FullImageRow(restaurant: restaurant)
//                }
                
//                ForEach(articles) { article in
//
//                    NavigationLink(
//                        destination: ArticleDetailView(article: article),
//                        label: {
//                            ArticleRow(article: article)
//                        })
//
//
//                }
                
                ForEach(articles) { article in
                    
                    ZStack {
                        
                        ArticleRow(article: article)
                        
                        NavigationLink(
                            destination: ArticleDetailView(article: article),
                            label: {
                                
                            })
                        .opacity(0)
                        
                    }
                    
                }
            }
//            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            
        }
        
    }
}

struct ArticleDetailView: View {
    
    @Environment(\.presentationMode) var mode
    
    var article: Article
    
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
                .navigationBarHidden(false)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.mode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "chevron.left.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                })
        )
        ///overlay for sheet
        .overlay(

            HStack {
                Spacer()

                VStack {
//                    Button(action: {
//                        self.mode.wrappedValue.dismiss()
//                    }, label: {
//                        Image(systemName: "chevron.down.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                    })
//                    .padding(.trailing, 20)
//                    .padding(.top, 40)
                    
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })

                    Spacer()
                }
            }
        )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Reminder"),
                  message: Text("Are you sure you finish reading the article?"),
                  primaryButton: .default(Text("Yes"),
                                          action: { self.mode.wrappedValue.dismiss() }),
                  secondaryButton: .cancel(Text("No")))
        }

    }

}


struct RestaurantDetailView: View {
    
    @Environment(\.presentationMode) var mode

    var restaurant: Restaurant

    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.mode.wrappedValue.dismiss()
                                }, label: {
                                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                                })
//                                Button("Back", action: {
//                                    self.mode.wrappedValue.dismiss()
//                                })
        )

    }
}

struct ArticleRow: View {
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
}


struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
