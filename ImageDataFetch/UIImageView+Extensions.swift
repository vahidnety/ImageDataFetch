//
//  UIImageViewExtension.swift
//  ImageDataFetch
//
//  Created by Vahid on 02/11/2020.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(from url: URL, withPlaceholder placeholder: UIImage? = nil) {
        self.image = placeholder
        URLSession.shared.dataTask(with: url) { data , _, _ in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
