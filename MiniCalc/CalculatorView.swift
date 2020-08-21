//
//  ContentView.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/13.
//

import SwiftUI

struct CalculatorView: View {
  @ObservedObject var model: CalculatorModel = CalculatorModel()
  
  var body: some View {
    ZStack {
      Color.offWhite.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      
      GeometryReader { proxy in
        self.build(proxy: proxy)
      }
      .padding([.leading, .trailing, .bottom], BUTTON_SPACE)
    }
  }
  
  func build(proxy: GeometryProxy) -> some View {
    let size = CGSize(
      width: (proxy.size.width - 20 * 3) / 4,
      height: (proxy.size.width - 20 * 3) / 4)
    
    return VStack {
      Spacer()
      
      HStack {
        Spacer()
        
        Text(model.brain.expression)
          .font(Font.custom("DS-Digital-BoldItalic", size: 66))
          .lineLimit(1)
          .minimumScaleFactor(0.4)
          .foregroundColor(.blue)
      }
      .padding(.bottom, 20)
      
      CalculatorButtonPad(model: model, brain: $model.brain, pad: $model.pad, btnSize: size)
    }
    .sheet(isPresented: $model.presentSheet, content: {
      self.buildSheet()
    })
  }
  
  func buildSheet() -> some View {
    return Group {
      if model.sheetCategory == .graph {
        NavigationView {
          WebView(url: "https://www.desmos.com/calculator")
            .navigationBarTitle("函数图像查看器", displayMode: .inline)
        }
      }
      else {
        buildInfoView()
      }
    }
  }
  
  enum InfoType {
    case info
    case empty
  }
  
  func buildInfoView() -> some View {
    let url = Special.days[model.luckyNumber]
    
    var sortedKeys = Special.days
      .keys
      .sorted()
      .map {
        return String($0 + "、")
      }
      .joined() // String
    sortedKeys.removeLast()
    
    var infoType: InfoType = .empty
    
    if url != nil {
      infoType = .info
    }
    
    return _buildInfo(sortedKeys: sortedKeys, infoType: infoType, url: url)
  }
  
  private func _buildInfo(sortedKeys: String, infoType: InfoType, url: String?) -> AnyView {
    switch infoType {
      case .info:
        return AnyView(WebView(url: url!))
      default:
        return AnyView(ZStack {
          Color(UIColor.tertiarySystemFill).edgesIgnoringSafeArea(.all)
          
          VStack {
            Text("🤔")
              .font(.system(size: 88))
              .padding(.bottom, 50)
            Text("Oops... 什么都没有查到喔，试着让计算结果是 " + sortedKeys + "再试试看吧 :)")
              .foregroundColor(.darkGray)
              .padding(.horizontal, 50)
          }
        })
    }
  }
}

//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    CalculatorView()
//  }
//}
