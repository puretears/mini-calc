//
//  Config.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/15.
//

import Foundation

struct Config {
  static private(set) var launchCount: Int {
    get {
      return UserDefaults.standard.integer(forKey: AppKeys.appLaunchCount)
    }
    set {
      UserDefaults.standard.set(newValue, forKey: AppKeys.appLaunchCount)
    }
  }
  
  static func incrementLaunchCounter() {
    launchCount += 1
  }
  
  static var typingVoice: String {
    get {
      return UserDefaults.standard.string(forKey: AppKeys.typingVoice) ?? ""
    }
    set {
      UserDefaults.standard.set(newValue, forKey: AppKeys.typingVoice)
    }
  }
  
  static func setDefaultTypingVoice() {
    typingVoice = AppKeys.moCn
  }
}

struct AppKeys {
  static let appLaunchCount = "octoape.app.minicalc"
  static let typingVoice = "octoape.app.typing.voice"
  
  static let moCn = "mo.cn"
  static let rongDe = "rong.de"
  static let ruiCn = "rui.cn"
  static let miCn = "mi.cn"
}
