import UIKit

extension CardItem {
    
    private var codeType: BarcodeGenerator.CodeType {
        return BarcodeGenerator.CodeType.code128Barcode
    }
    
    private var fileName: String {
        return title + "-" + code + "-" + codeType.rawValue + ".png"
    }
    
    func codeImage() -> UIImage? {
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let directoryPath = urls.first else {
            return nil
        }
        
        let filePath = directoryPath.appendingPathComponent(fileName)
        
        if fileManager.fileExists(atPath: filePath.absoluteString) {
            do {
                let imageData = try Data(contentsOf: filePath)
                return UIImage(data: imageData)
            } catch {
                print(error)
                return nil
            }
        } else {
            let image = BarcodeGenerator.shared.generate(type: codeType, from: code)
            if let imageData = image?.pngData() {
                do {
                    try imageData.write(to: filePath)
                } catch {
                    print(error)
                }
            }
            return image
        }
    }
}
