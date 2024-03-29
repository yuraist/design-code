//
//  BlurView.swift
//  DesignCode
//
//  Created by Yura Istomin on 13.10.2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
  
  let style: UIBlurEffect.Style
  
  func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
    let view = UIView(frame: .zero)
    
    view.backgroundColor = .clear
    let blurEffect = UIBlurEffect(style: style)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    view.insertSubview(blurView, at: 0)
    blurView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    blurView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
    
  }
  
}
