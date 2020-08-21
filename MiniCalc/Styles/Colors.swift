//
//  Colors.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/12.
//

import SwiftUI

extension Color {
  static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
  static let offBlack = Color(red: 0.25, green: 0.25, blue: 0.25)
  
  static let white07 = Color.white.opacity(0.7)
  static let black02 = Color.black.opacity(0.2)
  
  static let darkGray = Color(red: 0.192, green: 0.212, blue: 0.329)
  static let shadowGray = Color(red: 0.565, green: 0.608, blue: 0.667)
  static let lightGray = Color(red: 0.812, green: 0.851, blue: 0.890)
  
  static let borderGray = Color(red: 0.592, green: 0.651, blue: 0.710)
}

extension UIColor {
  static let offWhite = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1.0)
}

extension LinearGradient {
  init(_ colors: Color...) {
    self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
  }
  
  static let blackToClear = LinearGradient(Color.black, Color.clear)
  static let clearToBlack = LinearGradient(Color.clear, Color.black)
  
  static let horizontalDark = LinearGradient(
    gradient: Gradient(colors: [.shadowGray, .darkGray]),
    startPoint: .leading,
    endPoint: .trailing)
  
  static let diagonalDarkBorder = LinearGradient(
    gradient: Gradient(colors: [.white, .borderGray]),
    startPoint: UnitPoint(x: -0.1, y: 0.3),
    endPoint: .bottomTrailing)
}


