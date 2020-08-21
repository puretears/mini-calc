//
//  ButtonItem.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/12.
//

import Foundation

enum Command: String {
  case equ = "equal"
  case securePad = "lock.rotation"
  case lucky = "eyeglasses"
  case graph = "function"
  case ac = "power"
}

enum Op: String {
  case add   = "+"
  case minus = "-"
  case mul   = "×"
  case div   = "÷"
}

extension Op {
  var formatter: NumberFormatter {
    let fmt = NumberFormatter()
    fmt.minimumFractionDigits = 0
    fmt.maximumFractionDigits = 8
    fmt.numberStyle = .none
    
    return fmt
  }
  
  func calculate(l: String, r: String) -> String? {
    guard let left = Double(l), let right = Double(r) else {
      return nil
    }
    
    let result: Double?
    
    switch self {
      case .add:
        result = left + right
      case .minus:
        result = left - right
      case .mul:
        result = left * right
      case .div:
        result = right != 0 ? left / right : nil
    }
    
    if let result = result, result <= Double(Int.max) {
      return formatter.string(from: (result as NSNumber))
    }
    else {
      return nil
    }
    
  }
}

enum ButtonItem: Hashable {
  case digit(Int)
  case dot
  case op(Op)
  case command(Command)
}

extension ButtonItem {
  var title: String {
    switch self {
      case .digit(let value): return String(value)
      case .dot: return "."
      case .op(let op): return op.rawValue
      case .command(let cmd): return cmd.rawValue
    }
  }
  
  var isOp: Bool {
    switch self {
      case .op(_): return true
      default:
        return false
    }
  }
}

