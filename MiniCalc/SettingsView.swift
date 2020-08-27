//
//  SettingsView.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/13.
//

import SwiftUI

struct SettingsView: View {
  let team: [Member] = [
    Member(name: "Jiarui Wu", motto: "正道的光！！！", badge: "pencil.and.outline"),
    Member(name: "Rongxiao Liu", motto: "我要精进算法", badge: "book.circle"),
    Member(name: "Jiarui Li", motto: "下次我要赢到树莓派", badge: "hare"),
    Member(name: "Jinmo Wu", motto: "见识我的编程潜力吧", badge: "wand.and.stars")
  ]
  
  @State var sel: String = Config.typingVoice
  @State var isBtnAnimated: Bool = false
  @State var displayPrivacy: Bool = false
  
  init() {
    UINavigationBar
      .appearance()
      .largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        Color.offWhite.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        GeometryReader { proxy in
          VStack(spacing: 30) {
            self.buildNamecardScrollView(height: proxy.size.height * 0.4)
            self.buildSettingsForm()
          }
        }
        .sheet(isPresented: self.$displayPrivacy, content: {
          WebView(url: "https://boxueio.com/copyright")
        })
        .navigationBarTitle(Text("关于我们"))
      }
      
    }
  }
  
  func buildNamecardScrollView(height: CGFloat) -> some View {
    return ScrollView(.horizontal, showsIndicators: false, content: {
      HStack {
        ForEach(self.team, id: \.self) { member in
          Namecard(
            height: height,
            member: member)
            .padding([.horizontal, .bottom], 15)
        }
      }
    })
    .padding(.top)
  }
  
  func buildSettingsForm() -> some View {
    Form {
      self.buildVoiceSwitchingSection()
      self.buildButtonAnimationSection()
      self.buildPrivacyPolicy()
    }
    .onAppear(perform: {
      UITableView.appearance().backgroundColor = .clear
    })
    .shadow(color: Color.white07, radius: 4, x: -2, y: -2)
    .shadow(color: Color.black02, radius: 4, x: 2, y: 2)
    .padding(.bottom, 15)
  }
  
  func buildVoiceSwitchingSection() -> some View {
    Section(header: SectionHeader(iconName: "pencil.slash", title: "计算器设置")) {
      Picker("按键声音", selection: self.$sel, content: {
        Text("Jinmo Wu (中文)").tag(AppKeys.moCn)
        Text("Rongxiao Liu (德语)").tag(AppKeys.rongDe)
        Text("Jiarui Li (中文)").tag(AppKeys.miCn)
        Text("Jiarui Wu (中文)").tag(AppKeys.ruiCn)
      })
      .onReceive([self.sel].publisher.first()) { selection in
        Config.typingVoice = selection
        
        #if DEBUG
        print("Typing voice was changed to \(selection).")
        #endif
      }
    }
  }
  
  func buildButtonAnimationSection() -> some View {
    Section(header: SectionHeader(iconName: "pencil.slash", title: "计算器设置")) {
      Toggle(isOn: $isBtnAnimated) {
        Text("按钮动画")
      }
      .onReceive([self.isBtnAnimated].publisher.first()) { selection in
        
        #if DEBUG
        print("Button animation switched to: \(selection).")
        #endif
      }
    }
  }
  
  func buildPrivacyPolicy() -> some View {
    Section(header: SectionHeader(iconName: "doc.fill", title: "Documentary")) {
      Button(action: {
        self.displayPrivacy = true
      }, label: {
        Text("Privacy policy")
          .font(Font.system(.footnote))
      })
    }
  }
}

struct SectionHeader: View {
  let iconName: String
  let title: String
  
  var body: some View {
    return HStack {
      Image(systemName: iconName)
      Text(title)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
