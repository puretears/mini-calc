//
//  CalculatorModel.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/16.
//

import Combine
import Foundation

class CalculatorModel: ObservableObject {
  enum SheetCategory {
    case info
    case graph
  }
  
  let shadowPad: [[ButtonItem]] = [
    [.command(.ac), .command(.graph), .command(.lucky), .command(.securePad)],
    [.digit(7), .digit(8), .digit(9), .op(.div)],
    [.digit(4), .digit(5), .digit(6), .op(.mul)],
    [.digit(1), .digit(2), .digit(3), .op(.minus)],
    [.digit(0), .dot, .command(.equ), .op(.add)]
  ]
  
  @Published var brain: Brain = .left("0")
  @Published var pad: [[ButtonItem]] = [
    [.command(.ac), .command(.graph), .command(.lucky), .command(.securePad)],
    [.digit(7), .digit(8), .digit(9), .op(.div)],
    [.digit(4), .digit(5), .digit(6), .op(.mul)],
    [.digit(1), .digit(2), .digit(3), .op(.minus)],
    [.digit(0), .dot, .command(.equ), .op(.add)]
  ]
  
  @Published var presentSheet: Bool = false
  var sheetCategory: SheetCategory = .info
  var luckyNumber: String {
    return brain.expression
  }
  
  func apply(_ item: ButtonItem) {
    if item == .command(.securePad) {
      brain = brain.applySecurePadCommand {
        self.pad = shuffle2D(self.pad)
      }
    }
    else if item == .command(.lucky) {
      self.sheetCategory = .info
      self.presentSheet = true
    }
    else if item == .command(.graph) {
      self.sheetCategory = .graph
      self.presentSheet = true
    }
    else if item == .command(.ac) {
      self.pad = shadowPad
      brain = brain.apply(item: item)
    }
    else {
      brain = brain.apply(item: item)
    }
    
  }
}

