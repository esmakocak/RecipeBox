//
//  convertImage.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 25.07.2024.
//

import Foundation
import UIKit

extension UIImage {
    func toBase64() -> String? {
        return self.jpegData(compressionQuality: 1.0)?.base64EncodedString()
    }
    
    static func fromBase64(_ base64: String) -> UIImage? {
        guard let data = Data(base64Encoded: base64) else { return nil }
        return UIImage(data: data)
    }
}
