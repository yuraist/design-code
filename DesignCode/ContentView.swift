//
//  ContentView.swift
//  DesignCode
//
//  Created by Yura Istomin on 11.10.2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      VStack {
        Text("Placeholder")
      }
      .frame(width: 300, height: 220)
      .background(Color.blue)
      .cornerRadius(15)
      .shadow(radius: 20)
      .offset(x: 0, y: -20)
      
      VStack {
        HStack {
          VStack(alignment: .leading) {
            Text("UI Design")
              .font(.headline)
              .fontWeight(.bold)
              .foregroundColor(Color("accent"))
              .padding(.top)
            Text("Certificate")
              .font(.body)
              .foregroundColor(.white)
          }
          Spacer()
          Image("Logo")
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .padding(.horizontal)
        Spacer()
        Image("Background")
      }
      .frame(width: 340.0, height: 220)
      .background(Color.black)
      .cornerRadius(15)
      .shadow(radius: 20)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
