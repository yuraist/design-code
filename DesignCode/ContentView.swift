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
    VStack {
      VStack {
        Text("UI Design")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundColor(Color.purple)
          .padding(.top)
        Text("Certificate")
          .foregroundColor(.white)
      }
      Image("Background")
    }
    .background(Color.black)
    .cornerRadius(15)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
