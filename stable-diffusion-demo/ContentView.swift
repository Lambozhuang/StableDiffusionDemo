//
//  ContentView.swift
//  stable-diffusion-demo
//
//  Created by Lambo77 on 2022/12/4.
//

import SwiftUI

struct ContentView: View {
    @State private var prompt: String = ""
    var body: some View {
        VStack {
            TextField("Prompt:", text: $prompt)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!233")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
