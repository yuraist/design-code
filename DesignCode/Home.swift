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
  @State var showProfile = false
  
  var body: some View {
    
    ZStack {
      
      HomeList()
      
      ContentView()
        .cornerRadius(30)
        .shadow(radius: 20)
        .animation(.spring())
        .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
      
      TopMenuButtons(show: $show, showProfile: $showProfile)
        .animation(.spring())
        .offset(x: -30, y: showProfile ? 0 : 80)
      
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

struct CircleButton: View {
  
  var icon = "person.crop.circle"
  
  var body: some View {
    HStack {
      Image(systemName: icon)
        .foregroundColor(.black)
    }
    .frame(width: 44, height: 44)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(color: Color("buttonShadow"),
            radius: 10, x: 0, y: 10)
  }
}

struct MenuButton: View {
  
  @Binding var show: Bool
  
  var body: some View {
    Button(action: {
      self.show.toggle()
    }) {
      HStack {
        Spacer()
        Image(systemName: "list.dash")
          .foregroundColor(.black)
      }
      .padding(.trailing, 20)
      .frame(width: 90, height: 60)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"),
              radius: 10, x: 0, y: 10)
    }
  }
}

struct MenuRight: View {
  
  @Binding var show: Bool
  
  var body: some View {
    HStack {
      Spacer()
      Button(action: { self.show.toggle() }) {
        CircleButton()
      }
      Button(action: { self.show.toggle() }) {
        CircleButton(icon: "bell")
      }
    }
    .offset(x: 15)
  }
}

struct TopMenuButtons: View {
  
  @Binding var show: Bool
  @Binding var showProfile: Bool
  
  var body: some View {
    HStack {
      VStack {
        HStack {
          MenuButton(show: $show)
          MenuRight(show: $showProfile)
        }
        
        Spacer()
      }
    }
  }
}
