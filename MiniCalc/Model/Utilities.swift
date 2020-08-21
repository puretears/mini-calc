//
//  Array+Ex.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/16.
//
import UIKit
import Foundation

/**
 [
   [3, 8, 9],
   [1, 7, 6]
 ]

 joined

 [3, 8, 9, 1, 7, 6]

 shuffled

 [6, 9, 8, 7, 1, 3]
           ^

 [
   [6, 9, 8],
   [7, 1, 3]
 ]
 */
func shuffle2D<T>(_ array: [[T]]) -> [[T]] {
  var iter = array.joined().shuffled().makeIterator()
  
  return array.map { $0.compactMap { _ in iter.next() }}
}

func topHeart(x: CGFloat) -> CGFloat {
  return pow(1 - pow(abs(x) - 1, 2), 0.5)
}

func bottomHeart(x: CGFloat) -> CGFloat {
  return acos(1 - abs(x)) - CGFloat.pi
}
