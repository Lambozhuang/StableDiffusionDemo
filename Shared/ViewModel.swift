//
//  ViewModel.swift
//  stable-diffusion-demo
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
    
    private let stableDiffusion = StableDiffuser()
    
    func generateImage(with prompt: String) async {
        self.state = .inProgress
        if prompt == "" {
            self.state = .failed
            self.notification = "Invalid prompt."
            return
        }
        do {
            let generatedImage = try await stableDiffusion.generateImageWithStableDiffusion(prompt: prompt, progressHandler: { progress in
                DispatchQueue.main.async {
                    self.progressValue = Double(progress.step) / Double(progress.stepCount)
                    print(self.progressValue)
                }
                return true
            })
            self.image = Image(generatedImage!, scale: 1, label: Text("Image"))
            self.state = .none
        } catch {
            print("Error: \(error)")
            self.notification = "Generating failed. \(error)"
            self.state = .failed
        }
    }
}
