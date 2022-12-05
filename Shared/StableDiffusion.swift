//
//  StableDiffusion.swift
//  stable-diffusion-demo
//
//  Created by Lambo77 on 2022/12/4.
//

import Foundation
import StableDiffusion
import CoreGraphics

enum StableDiffusionError: Error {
    case resourcesNotFound
    case piplineNotFound
    case failedGeneratingImage
}

enum StableDiffusionState {
    case none
    case inProgress
    case failed
}

struct StableDiffuser {
    
    func generateImageWithStableDiffusion(prompt: String, progressHandler: (StableDiffusionPipeline.Progress) -> Bool = { _ in true }) async throws -> CGImage? {
        guard let resourcesURL = Bundle.main.url(forResource: "Resources", withExtension: nil) else {
            throw StableDiffusionError.resourcesNotFound
        }
        guard let pipline = try? StableDiffusionPipeline(resourcesAt: resourcesURL) else {
            throw StableDiffusionError.piplineNotFound
        }
        guard let generatedImage = try? pipline.generateImages(prompt: prompt, disableSafety: true, progressHandler: progressHandler).first else {
            throw StableDiffusionError.failedGeneratingImage
        }
        return generatedImage
    }
}
