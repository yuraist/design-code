//
//  ContentView.swift
//  DesignCode
//
//  Created by Yura Istomin on 11.10.2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var show = false
  @State var viewState = CGSize.zero
  
  var body: some View {
    
    ZStack {
      
      BlurView(style: .extraLight)
      
      TitleView()
        .blur(radius: show ? 20 : 0)
        .animation(.default)
      
      CardBottomView()
        .blur(radius: show ? 20 : 0)
        .animation(.default)
      
      CertificateView()
        .offset(x: 0, y: show ? -300 : -40)
        .scaleEffect(0.85)
        .rotationEffect(Angle(degrees: show ? 15 : 0))
        //        .rotation3DEffect(Angle(degrees: show ? 50 : 0),
        //                          axis: (x: 10, y: 10, z: 10))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.7))
        .offset(x: viewState.width, y: viewState.height)
      
      CertificateView()
        .offset(x: 0, y: show ? -150 : -20)
        .scaleEffect(0.9)
        .rotationEffect(Angle(degrees: show ? 10 : 0))
        //        .rotation3DEffect(Angle(degrees: show ? 40 : 0),
        //                          axis: (x: 10, y: 10, z: 10))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.5))
        .offset(x: viewState.width, y: viewState.height)
      
      CertificateView()
        .offset(x: viewState.width, y: viewState.height)
        .scaleEffect(0.95)
        .rotationEffect(Angle(degrees: show ? 5 : 0))
        //        .rotation3DEffect(Angle(degrees: show ? 30 : 0),
        //                          axis: (x: 10, y: 10, z: 10))
        .animation(.spring())
        .onTapGesture {
          self.show.toggle()
        }
        .gesture(
          DragGesture()
            .onChanged { value in
              self.viewState = value.translation
              self.show = true
            }
            .onEnded { _ in
              self.viewState = .zero
              self.show = false
            }
        )
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
