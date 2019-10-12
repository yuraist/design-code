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
      HStack {
        VStack(alignment: .leading) {
          Text("UI Design")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("accent"))
            .padding(.top)
          Text("Certificate")
            .foregroundColor(.white)
        }
        Spacer()
        Image("Logo")
          .resizable()
          .frame(width: 30.0, height: 30.0)
      }
      .padding(.horizontal)
      Image("Background")
    }
    .frame(width: 340.0, height: 220)
    .background(Color.black)
    .cornerRadius(15)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
