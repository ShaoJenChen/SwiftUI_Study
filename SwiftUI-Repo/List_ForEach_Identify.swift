//
//  List_ForEach_Identify.swift
//  SwiftUI-Repo
//
//  Created by 陳劭任 on 2020/12/12.
//

import SwiftUI

var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
               Restaurant(name: "Homei", image: "homei"),
               Restaurant(name: "Teakha", image: "teakha"),
               Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
               Restaurant(name: "Petite Oyster", image: "petiteoyster"),
               Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
               Restaurant(name: "Po's Atelier", image: "posatelier"),
               Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
               Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
               Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
               Restaurant(name: "Homei", image: "upstate"),
               Restaurant(name: "Traif", image: "traif"),
               Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
               Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
               Restaurant(name: "Five Leaves", image: "fiveleaves"),
               Restaurant(name: "Cafe Lore", image: "cafelore"),
               Restaurant(name: "Confessional", image: "confessional"),
               Restaurant(name: "Barrafina", image: "barrafina"),
               Restaurant(name: "Donostia", image: "donostia"),
               Restaurant(name: "Royal Oak", image: "royaloak"),
               Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
]

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}


struct List_ForEach_Identify: View {
    
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//
//    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    
    var body: some View {
//        List(restaurants, id: \.id) { restaurant in
//            HStack {
//                Image(restaurant.image)
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .cornerRadius(5)
//                Text(restaurant.name)
//            }
//        }
        
//        List(restaurants) { restaurant in
//            BasicImageRow(restaurant: restaurant)
//        }
        
//        List(restaurants) { restaurant in
//            FullImageRow(restaurant: restaurant)
//        }
        
        List(restaurants.indices) { index in
            if 0 ... 1 ~= index {
                FullImageRow(restaurant: restaurants[index])
            }
            else {
//                BasicImageRow(restaurant: self.restaurants[index])
                CardView(imageName: restaurants[index].image,
                         category: "GeoVision",
                         heading: restaurants[index].name,
                         author: "SJ")
            }
        }
    }
}

struct List_ForEach_Identify_Previews: PreviewProvider {
    static var previews: some View {
        List_ForEach_Identify()
    }
}

struct BasicImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
