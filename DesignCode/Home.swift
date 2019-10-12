//
//  Home.swift
//  DesignCode
//
//  Created by Yura Istomin on 12.10.2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import SwiftUI

struct Home: View {
  
  @State var show = false
  
  var body: some View {
    
    ZStack {
      Button(action: {
        self.show.toggle()
      }) {
        Text("Open menu")
      }
      
      MenuView(show: $show)
    }
    
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct MenuRow: View {
  
  var image = "creditcard"
  var text = "My Account"
  
  var body: some View {
    HStack {
      HStack {
        Image(systemName: image)
          .imageScale(.large)
          .frame(width: 32, height: 32)
        
        Text(text)
          .font(.headline)
      }
      Spacer()
    }
  }
}

struct Menu: Identifiable {
  var id = UUID()
  var title: String
  var icon: String
}

struct MenuView: View {
  
  let menuItems = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
  ]
  
  @Binding var show: Bool
  
  var body: some View {
    VStack(alignment: .leading) {
      ForEach(menuItems) { item in
        MenuRow(image: item.icon, text: item.title)
      }
      Spacer()
    }
    .padding(.top, 20)
    .padding(30)
    .frame(minWidth: 0, maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
    .padding(.trailing, 60)
    .shadow(radius: 20)
    .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10, z: 0))
    .animation(.default)
    .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    .onTapGesture {
      self.show.toggle()
    }
  }
}
