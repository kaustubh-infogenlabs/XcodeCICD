//
//  ContentView.swift
//  XcodeCICD
//
//  Created by Kaustubh Jirapure on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var word: String = ""

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false

    var body: some View {
        NavigationStack {
            List {
                Section("Enter your word") {
                    TextField("Your word", text: $word)
                }

                Button("Submit") {
                    checkIfPalindrome()
                }
            }
            .navigationTitle("Check If Palindrome")
            .onSubmit(checkIfPalindrome)
            .alert(alertTitle, isPresented: $showingAlert) { } message: {
                Text(alertMessage)
            }
            .padding()
        }
    }

    func checkIfPalindrome() {
        let isPalindrome = Self.isPalindrome(word)
        
        if isPalindrome {
            alertTitle = "Correct"
            alertMessage = "Entered word is a palindrome"
        } else {
            alertTitle = "Incorrect"
            alertMessage = "Entered word is not a palindrome"
        }
        
        showingAlert = true
    }
    
    static func isPalindrome(_ word: String) -> Bool {
        word == String(word.reversed())
    }
}

#Preview {
    ContentView()
}
