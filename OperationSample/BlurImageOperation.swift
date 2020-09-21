//
//  BlurImageOperation.swift
//  OperationSample
//
//  Created by Mad Brains on 25.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import Foundation
import UIKit

class BlurImageOperation: Operation {
    
    var inputImage: UIImage
    var outputImage: UIImage?
    
    override func main() {
        let inputCIImage = CIImage(image: inputImage)!
        let filter = CIFilter(name: "CIGaussianBlur", parameters: [kCIInputImageKey: inputCIImage])!
        let outputCIImage = filter.outputImage!
        let context = CIContext()
        
        let cgiImage = context.createCGImage(outputCIImage, from: outputCIImage.extent)
        
        // Кладем размытое изображение в свойство
        outputImage = UIImage(cgImage: cgiImage!)
    }
    
    init(inputImage: UIImage) {
        self.inputImage = inputImage
        super.init()
    }
    
}
