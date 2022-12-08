//
//  ViewModel.swift
//  StableDiffusionDemo
//
//  Created by Lambo77 on 2022/12/5.
//

import Foundation
import StableDiffusion
import CoreGraphics
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    @Published var image: Image = Image("dummy-image")
    @Published var state: StableDiffusionState = .none
    @Published var progressValue = 0.0
    @Published var notification = ""
    @Published var timeSpent = 0.0
    
    private let stableDiffuser = StableDiffuser()
    
    func generateImage(with prompt: String) async {
        self.timeSpent = 0.0
        self.progressValue = 0.0
        self.state = .inProgress
        if prompt == "" {
            self.state = .failed
            self.notification = "Invalid prompt."
            return
        }
        let start = CFAbsoluteTimeGetCurrent()
        do {
            let generatedImage = try await stableDiffuser.generateImageWithStableDiffusion(prompt: prompt, progressHandler: { progress in
                DispatchQueue.main.async {
                    self.progressValue = Double(progress.step) / Double(progress.stepCount)
                    print(self.progressValue)
                }
                return true
            })
            timeSpent = CFAbsoluteTimeGetCurrent() - start
            self.image = Image(generatedImage!, scale: 1, label: Text("Image"))
            self.state = .success
        } catch {
            print("Error: \(error)")
            self.notification = "Generating failed. \(error)"
            self.state = .failed
        }
    }
}
