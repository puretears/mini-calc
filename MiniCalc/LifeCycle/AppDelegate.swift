//
//  AppDelegate.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/13.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
//    for fontFamily in UIFont.familyNames {
//        for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
//            print("\(fontName)")
//        }
//    }
    
    if Config.launchCount == 0 {
      // Set default typing voice
      Config.setDefaultTypingVoice()
    }
    
    Config.incrementLaunchCounter()
    
    #if DEBUG // Preprocessing
    print("Launching count: \(Config.launchCount)")
    print("Current typing voice: \(Config.typingVoice)")
    #endif
    
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

