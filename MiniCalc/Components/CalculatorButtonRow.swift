//
//  CalculatorButtonRow.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/13.
//

import SwiftUI

struct CalculatorButtonRow: View {
  @Environment(\.speaker) var speaker: AudioPlayer
  var model: CalculatorModel
  @Binding var brain: Brain
  
  let btnSize: CGSize
  let row: [ButtonItem]
  
  var body: some View {
    self.build()
  }
  
  func build() -> some View {
    HStack(spacing: BUTTON_SPACE) {
      ForEach(row, id: \.self) { item in
        self.build(item: item)
      }
    }
  }
  
  func build(item: ButtonItem) -> some View {
    let isDisabled = brain.isCalculationOnly && item.isOp
    
    switch item {
      case .command(_):
        return CalculatorButton(
          title: item.title,
          style: CalculatorButtonStyle(size: btnSize),
          isSpecial: true,
          isDisabled: isDisabled,
          action: {
            print("\(item.title) was pressed")
            self.model.apply(item)
            self.speaker.play(item)
          })
      default:
        return CalculatorButton(
          title: item.title,
          style: CalculatorButtonStyle(size: btnSize),
          isDisabled: isDisabled,
          action: {
            print("\(item.title) was pressed")
            self.speaker.play(item)
            self.model.apply(item)
          })
    }
  }
}

//struct CalculatorButtonRow_Previews: PreviewProvider {
//  static var previews: some View {
//    CalculatorButtonRow(
//      brain: Binding<Brain>.constant(.left("0")),
//      row: [
//        ButtonItem.digit(0), ButtonItem.dot, ButtonItem.command(.equ), ButtonItem.op(.add)
//      ],
//      btnSize: CGSize(width: 80, height: 80))
//  }
//}

