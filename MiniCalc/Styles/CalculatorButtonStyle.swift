//
//  NeumorphicButtonStyle.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/11.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
  let size: CGSize
  
  struct WrappedButton: View {
    let size: CGSize
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    var body: some View {
      let cover = RoundedRectangle(cornerRadius: size.width / 6)
      let normalColor = configuration.isPressed ? Color.white : Color.offBlack
      let btnFgColor = isEnabled ? normalColor : Color.shadowGray
      
      return configuration.label
        .padding(10)
        .contentShape(cover)
        .frame(width: size.width, height: size.width)
        .foregroundColor(btnFgColor)
        .background(
          Group {
            if configuration.isPressed {
              cover.fill(Color.offWhite)
                .overlay(
                  cover.stroke(Color.gray, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(cover.fill(LinearGradient.blackToClear))
                )
                .overlay(
                  cover.stroke(Color.white, lineWidth: 8)
                    .blur(radius: 4)
                    .offset(x: -2, y: -2)
                    .mask(cover.fill(LinearGradient.clearToBlack))
                )
            }
            else {
              cover
                .fill(Color.offWhite)
                .shadow(color: Color.white07, radius: 4, x: -2, y: -2)
                .shadow(color: Color.black02, radius: 4, x: 2, y: 2)
            }
          }
        )
    }
  }
  
  func makeBody(configuration: Configuration) -> some View {
    WrappedButton(size: size, configuration: configuration)
  }
}

