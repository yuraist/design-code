//
//  HomeList.swift
//  DesignCode
//
//  Created by Yura Istomin on 12.10.2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import SwiftUI

struct HomeList: View {
  
  let courses = [
    Course(
      title: "Build an app with SwiftUI",
      image: "Illustration1",
      color: Color("background3"),
      shadowColor: Color("shadow3")
    ),
    Course(
      title: "Design Course",
      image: "Illustration2",
      color: Color("background4"),
      shadowColor: Color("shadow4")
    ),
  ]
  
  @State var showingModal = false
  
  var body: some View {
    
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 30) {
        ForEach(courses) { course in
          
          Button(action: {
            self.showingModal.toggle()
          }) {
            CourseView(course: course)
          }.sheet(isPresented: self.$showingModal) {
            ContentView()
          }
          
        }
      }
      .padding(.leading, 10)
      
      Spacer()
    }
  }
}

struct HomeList_Previews: PreviewProvider {
  static var previews: some View {
    HomeList()
  }
}

struct CourseView: View {
  
  var course: Course
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(course.title)
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(20)

      Spacer()
      
      Image(course.image)
        .resizable()
        .renderingMode(.original)
        .aspectRatio(contentMode: .fit)
        .frame(width: 246, height: 200)
        .padding(.bottom, 30)
    }
    .background(course.color)
    .cornerRadius(30)
    .frame(width: 246, height: 360)
    .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
  }
}

struct Course: Identifiable {
  var id = UUID()
  var title: String
  var image: String
  var color: Color
  var shadowColor: Color
}
