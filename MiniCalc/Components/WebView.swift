//
//  WebView.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/20.
//
import WebKit
import SwiftUI

struct WebView: View, UIViewRepresentable {
  var url: String
  var webView: WKWebView
  
  typealias UIViewType = UIViewContainerView<WKWebView>
  
  init(url: String, webView: WKWebView = WKWebView()) {
    self.url = url
    self.webView = webView
    webView.load(URLRequest(url: URL(string: url)!))
  }
  
  func makeUIView(context: Context) -> UIViewContainerView<WKWebView> {
    return UIViewContainerView()
  }
  
  func updateUIView(_ uiView: UIViewContainerView<WKWebView>, context: Context) {
    if uiView.contentView !== webView {
      uiView.contentView = webView
    }
  }
}


class UIViewContainerView<ContentView: UIView>: UIView {
  var contentView: ContentView? {
    willSet {
      contentView?.removeFromSuperview()
    }
    didSet {
      if let contentView = contentView {
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
          contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
          contentView.topAnchor.constraint(equalTo: topAnchor),
          contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
      }
    }
  }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
      WebView(url: "https://www.google.com")
    }
}
