//
//  CalculatorButton.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/12.
//

import SwiftUI

struct CalculatorButton<T: ButtonStyle>: View {
  let fontSize: CGFloat = 26
  let title: String
  let style: T
  var isSpecial: Bool = false
  var isDisabled: Bool = false
  var action: () -> Void = {}
  
  var body: some View {
    Button(action: action, label: {
      self.build()
    })
    .buttonStyle(style)
    .disabled(isDisabled)
  }
  
  func build() -> some View {
    return Group {
      if !isSpecial {
        Text(title)
          .font(.system(size: fontSize))
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      }
      else {
        Image(systemName: title)
          .font(Font.system(size: 26, weight: .semibold))
      }
    }
  }
}

struct CalculatorButton_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Spacer()
      
      HStack {
        Spacer()
        
        CalculatorButton(
          title: "0",
          style: CalculatorButtonStyle(size: CGSize(width: 200, height: 200)),
          action: {})
        
        Spacer()
      }
      
      Spacer()
    }
    .background(Color.offWhite)
  }
}

