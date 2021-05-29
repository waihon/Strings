//
//  ContentView.swift
//  Strings
//
//  Created by Waihon Yew on 29/05/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    let input =
      """
      aardvark
      abacuses
      abalones
      """
    let words = input.components(separatedBy: "\n")
    return VStack {
      List(words, id: \.self) {
        Text($0)
      }
      Form {
        Section(header: Text("Random Word")) {
          Text(words.randomElement()!)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
