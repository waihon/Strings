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
      abcdefgh
      """
    let words = input.components(separatedBy: "\n")
    let original = "  To be, or not to be, that's the question\n  "
    let trimmed = original.trimmingCharacters(in: .whitespacesAndNewlines)
    let checker = UITextChecker()
    return VStack {
      List(words, id: \.self) { word in
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        Text("\(word): \(allGood ? "correct" : "wrong")")
      }
      Form {
        Section(header: Text("Random Word")) {
          Text(words.randomElement()!)
        }
        Section(header: Text("Original")) {
          Text(original)
        }
        Section(header: Text("Trimmed")) {
          Text(trimmed)
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
