## Stable Diffusion Demo
This project is for demo purposes only.

---

### Walkthrough
#### 1. Prepare your model
Go to [Apple's ml-stable-diffusion repo](https://github.com/apple/ml-stable-diffusion#converting-models-to-coreml) and Follow the instructions of the "Converting Models to Core ML" section. When in step 4, you will need to add the `--bundle-resources-for-swift-cli` to the python command in order to generate the necessary resources for using the StableDiffusion swift package.

#### 2. Move the `Resources` folder
After converting the model to Core ML model, you will find a `Resources` folder in the output directory. Copy it to this project's root directory and compile it as a static resource.

---

### Problems
Currently I find nowhere to download SDKs for iOS 16.2 beta in Xcode 14.1 so the iOS demo is not completed. Though the macOS demo is working just fine on Apple Silicon machines on Ventura 13.1 beta4. (5th Dec, 2022)
