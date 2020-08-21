//
//  String+Ex.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/15.
//

import Foundation

extension String {
  func concat(_ digit: Int) -> String {
    return self == "0" ? "\(digit)" : "\(self)\(digit)"
  }
  
  func concatDot() -> String {
    return contains(".") ? self : "\(self)."
  }
}
