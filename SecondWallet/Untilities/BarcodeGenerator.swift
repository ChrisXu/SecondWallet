//
//  BarcodeGenerator.swift
//  SecondWallet
//
//  Created by Chris Xu on 2019/9/8.
//  Copyright © 2019 chrisxu. All rights reserved.
//

import UIKit

struct BarcodeGenerator {
    
    enum CodeType: String {
        case code128Barcode = "CICode128BarcodeGenerator"
    }
    
    static let shared = BarcodeGenerator()
    
    func generate(type: CodeType = .code128Barcode, from string: String) -> UIImage? {
        
        guard let filter = CIFilter(name: type.rawValue) else {
            return nil
        }
        
        switch type {
        case .code128Barcode:
            let data = string.data(using: String.Encoding.ascii)
            filter.setValue(data, forKey: "inputMessage")
        }
        
        let transform = CGAffineTransform(scaleX: 3, y: 3)
        guard let output = filter.outputImage?.transformed(by: transform) else {
            return nil
        }
        
        guard let cgImage = CIContext(options: nil).createCGImage(output, from: output.extent) else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }
}
