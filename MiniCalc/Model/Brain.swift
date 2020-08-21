//
//  Brain.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/15.
//

import Foundation

enum Brain {
  case left(String)
  case leftOp(left: String, op: Op)
  case leftOpRight(left: String, op: Op, right: String)
  case error(String)
}

extension Brain {
  var isCalculationOnly: Bool {
    switch self {
      case .leftOp(_, _): return true
      case .leftOpRight(_, _, _): return true
      default:
        return false
    }
  }
  
  var expression: String {
    let result: String
    
    switch self {
      case .left(let leftExpr):
        result = leftExpr
      case .leftOp(let leftExpr, let op):
        result = leftExpr + " " + op.rawValue
      case .leftOpRight(let leftExpr, let op, let rightExpr):
        result = leftExpr + " " + op.rawValue + " " + rightExpr
      case .error(let message):
        result = message
    }
    
    return result
  }
  
  func apply(item: ButtonItem) -> Brain {
    switch item {
      case .digit(let digit):
        // handle numbers
        return apply(digit: digit)
      case .dot:
        // handle dot
        return applyDot()
      case .op(let op):
        // handle operator
        return apply(op: op)
      case .command(let cmd):
        return apply(command: cmd)
    }
  }
  
  func apply(digit: Int) -> Brain {
    switch self {
      case .left(let leftExpr):
        // Concatenate the digit to the existing left operand
        return .left(leftExpr.concat(digit))
      case .leftOp(let leftExpr, let op):
        return .leftOpRight(left: leftExpr, op: op, right: "0".concat(digit))
      case .leftOpRight(let leftExpr, let op, let rightExpr):
        return .leftOpRight(left: leftExpr, op: op, right: rightExpr.concat(digit))
      case .error:
        return .left("0".concat(digit))
    }
  }
  
  func applyDot() -> Brain {
    switch self {
      case .left(let leftExpr):
        return .left(leftExpr.concatDot())
      case .leftOp(let leftExpr, let op):
        return .leftOpRight(left: leftExpr, op: op, right: "0".concatDot())
      case .leftOpRight(let leftExpr, let op, let rightExpr):
        return .leftOpRight(left: leftExpr, op: op, right: rightExpr.concatDot())
      case .error:
        return .left("0".concatDot())
    }
  }
  
  func apply(op: Op) -> Brain {
    switch self {
      case .left(let leftExpr):
        return .leftOp(left: leftExpr, op: op)
      default:
        return .left("0")
    }
  }
  
  func apply(command: Command) -> Brain {
    switch command {
      case .equ:
        return applyEquCommand()
      case .ac:
        return .left("0")
      default:
        return .error("Invalid Command")
    }
  }
  
  func applyEquCommand() -> Brain {
    switch self {
      case .leftOpRight(let l, let op, let r):
        guard let result = op.calculate(l: l, r: r) else {
          return .error("out of range")
        }
        
        return .left(result)
      default:
        return .left("0")
    }
  }
  
  func applySecurePadCommand(_ action: () -> Void) -> Brain {
    action()
    return self
  }
}

