//
//  AudioPlayer.swift
//  MiniCalc
//
//  Created by Mars on 2020/8/17.
//
import SwiftUI
import AVFoundation

struct SpeakerKey: EnvironmentKey {
  static let defaultValue = AudioPlayer.shared
}

extension EnvironmentValues {
  var speaker: AudioPlayer {
    get {
      return self[SpeakerKey.self]
    }
  }
}

class AudioPlayer {
  static let shared = AudioPlayer()
  private var player: AVAudioPlayer! // nil
  
  init() {
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
    }
    catch let error {
      print(error.localizedDescription)
    }
  }
  
  func play(_ buttonItem: ButtonItem) {
    guard let voiceCategory = UserDefaults.standard.string(forKey: AppKeys.typingVoice),
          let voices = Voice.typing[voiceCategory],
          let audioFile = voices[buttonItem.title],
          let url = Bundle.main.url(forResource: audioFile, withExtension: "m4a") else {
      return
    }
    DispatchQueue.global().async {
      do {
        self.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.aiff.rawValue)
        self.player.play()
      }
      catch let error {
        print(error.localizedDescription)
      }
    }
    
    
  }
}

