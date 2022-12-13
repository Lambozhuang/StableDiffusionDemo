## Stable Diffusion Demo
This project is for demo purposes only.

---

### Walkthrough
#### 1. Prepare your model
Go to [Apple's ml-stable-diffusion repo](https://github.com/apple/ml-stable-diffusion#converting-models-to-coreml) and Follow the instructions of the "Converting Models to Core ML" section. When in step 4, you will need to add the `--bundle-resources-for-swift-cli` to the python command in order to generate the necessary resources for using the StableDiffusion swift package.

#### 2. Move the `Resources` folder
After converting the model to Core ML model, you will find a `Resources` folder in the output directory. Copy it to this project's root directory and rename it to `StableDiffusionResources` and create a reference for the folder in the Xcode navigator and make sure this folder is appearing in the `Copy Bundle Resources` in the build phase of the build target configuration.

---

### Problems
Since the Xcode 14.2 RC is released, I can build and deploy the project on a iPad Pro (M2) and a iPhone 12 Pro Max and the M2 iPad runs very well but the iPhone 12 Pro Max crashed every time, which may caused by lack of memory. (13th Dec, 2022)
