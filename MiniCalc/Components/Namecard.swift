//
//  Namecard.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/14.
//

import SwiftUI

struct Namecard: View {
  let height: CGFloat
  var width: CGFloat {
    self.height * 0.64
  }
  
  var member: Member
  
  var body: some View {
    VStack {
      LinearGradient.horizontalDark
        .mask(Image(systemName: member.badge).resizable().scaledToFit())
        .frame(width: width, height: height)
        .padding([.horizontal, .top], 40)
//        .padding(.bottom, 15)
        .font(.system(size: 150, weight: .thin))
        .shadow(color: Color.white, radius: 2, x: -3, y: -3)
        .shadow(color: Color.shadowGray, radius: 2, x: 3, y: 3)
      
      HStack {
        Text(member.motto)
          .font(Font.system(.footnote))
          .foregroundColor(Color.offBlack)
      }
      .padding(.bottom, 10)
      
      HStack {
        Text(member.name)
          .foregroundColor(Color.darkGray)
          .bold()
          .padding(.leading)
          .padding(.bottom)
        
        Spacer()
      }
    }
    .frame(width: width + 80)
    .overlay(
      RoundedRectangle(cornerRadius: 15).stroke(LinearGradient.diagonalDarkBorder, lineWidth: 2)
    )
    .background(Color.offWhite)
    .cornerRadius(15)
    .shadow(color: Color.white07, radius: 4, x: -4, y: -4)
    .shadow(color: Color.black02, radius: 4, x: 4, y: 4)
  }
}

struct Namecard_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.offWhite
     
      Namecard(height: 400, member: Member(name: "JiaRui Wu", motto: "", badge: "pencil.and.outline"))
    }
    
  }
}
