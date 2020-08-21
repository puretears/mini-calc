//
//  AppTabView.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/13.
//

import SwiftUI

struct AppTabView: View {
  init() {
    UITabBar.appearance().barTintColor = UIColor.offWhite
    UITabBar.appearance().tintAdjustmentMode = .normal
    
    // Remove the top 1px line
    UITabBar.appearance().clipsToBounds = true
    UITabBar.appearance().layer.borderWidth = 0
  }
  
  var body: some View {
    TabView {
      CalculatorView()
        .tabItem {
          Image(systemName: "speedometer")
          Text("计算器")
        }
      
      SettingsView()
        .tabItem {
          Image(systemName: "person.2.square.stack")
          Text("关于我们")
        }
    }
    .accentColor(.pink)
  }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
