//
//  ContentView.swift
//  StableDiffusionDemo
//
//  Created by Lambo77 on 2022/12/4.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var prompt: String = ""
    
    var body: some View {
        VStack {
            if viewModel.state == .inProgress {
                VStack {
                    ProgressView(value: viewModel.progressValue, total: 1)
                    Text("Generating image...")
                        .padding(.trailing)
                }
                .frame(width: 400, height: 400)
                .padding()
            } else {
                viewModel.image
                    .resizable()
                    .frame(width: 400, height: 400)
                    .scaledToFit()
                    .padding()
            }
            if viewModel.state == .success {
                Text("Time spent: \(viewModel.timeSpent)")
            }
            
            VStack(alignment: .leading) {
                TextField("Prompt:", text: $prompt, axis: .vertical)
                    .frame(width: 400)
                    .disabled(viewModel.state == .inProgress)
                    .textFieldStyle(.roundedBorder)
                if viewModel.state == .failed {
                    Text(viewModel.notification)
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            
            Button("Generate Image") {
                Task {
                    await viewModel.generateImage(with: prompt)
                }
            }
            .disabled(viewModel.state == .inProgress)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
