//
//  CalculatorButtonPad.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/13.
//

import SwiftUI

let BUTTON_SPACE: CGFloat = 20

struct CalculatorButtonPad: View {
  var model: CalculatorModel
  @Binding var brain: Brain
  @Binding var pad: [[ButtonItem]]
  
  let btnSize: CGSize
  
  var body: some View {
    VStack(spacing: BUTTON_SPACE) {
      ForEach(pad, id: \.self) { row in
        CalculatorButtonRow(
          model: self.model,
          brain: self.$brain,
          btnSize: self.btnSize,
          row: row)
      }
    }
  }
}

//struct CalculatorButtonPad_Previews: PreviewProvider {
//  static var previews: some View {
//    return CalculatorButtonPad(
//      brain: Binding<Brain>.constant(.left("0")),
//      btnSize: CGSize(width: 80, height: 80))
//  }
//}

