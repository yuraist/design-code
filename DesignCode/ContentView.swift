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
      
      TitleView()
      
      CardBottomView()
      
      CardView()
        .offset(x: 0, y: -40)
        .scaleEffect(0.85)
        .rotationEffect(Angle(degrees: 15))
        .rotation3DEffect(Angle(degrees: 50),
                          axis: (x: 10, y: 10, z: 10))
        .blendMode(.hardLight)

      CardView()
        .offset(x: 0, y: -20)
        .scaleEffect(0.9)
        .rotationEffect(Angle(degrees: 10))
        .rotation3DEffect(Angle(degrees: 40),
                          axis: (x: 10, y: 10, z: 10))
        .blendMode(.hardLight)
      
      CertificateView()
        .scaleEffect(0.95)
        .rotationEffect(Angle(degrees: 5))
        .rotation3DEffect(Angle(degrees: 30),
                          axis: (x: 10, y: 10, z: 10))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct CardView: View {
  var body: some View {
    VStack {
      Text("Background Card")
    }
    .frame(width: 340, height: 220)
    .background(Color.blue)
    .cornerRadius(15)
    .shadow(radius: 20)
  }
}

struct CertificateView: View {
  var body: some View {
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

struct TitleView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Certificates")
          .font(.largeTitle)
          .fontWeight(.heavy)
        Spacer()
      }
      Image("Illustration5")
      Spacer()
    }.padding()
  }
}

struct CardBottomView: View {
  var body: some View {
    VStack(spacing: 20) {
      Rectangle()
        .frame(width: 60, height: 6)
        .cornerRadius(3.0)
        .opacity(0.1)
      
      Text("This certificate is proof that Yura Istomin has achieved the UI Design course with approval from a Design+Code intructor.")
      
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .padding()
    .padding(.horizontal)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(radius: 20)
    .offset(y: 600)
  }
}
