//
//  SheetAndAlert.swift
//  SwiftUI-Repo
//
//  Created by ShaoJen Chen on 2020/12/17.
//

import SwiftUI

struct SheetAndAlert: View {
    
//    @State var showDetailView = false
    
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
//                        self.showDetailView = true
                        self.selectedArticle = article
                    }
            }
//            .sheet(isPresented: $showDetailView, content: {
//
//                if let selectedArticle = self.selectedArticle {
//                    ArticleDetailView(article: selectedArticle)
//                }
//
//            })
            
//            .sheet(item: self.$selectedArticle, content: { (article) in
//                ArticleDetailView(article: article)
//            })
            .fullScreenCover(item: self.$selectedArticle, content: { (article) in
                ArticleDetailView(article: article)
            })
            .navigationBarTitle("Your Reading")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SheetAndAlert_Previews: PreviewProvider {
    static var previews: some View {
        SheetAndAlert()
    }
}
