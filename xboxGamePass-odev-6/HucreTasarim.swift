//
//  HucreTasarim.swift
//  xboxGamePass-odev-6
//
//  Created by İbrahim Cem Ekti on 7.08.2024.
//

import UIKit

class HucreTasarim: UICollectionViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelKategori: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Gradient Layer oluşturma ve ekleme
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            
            // Kapalı yeşil ve kapalı sarı renkler
            let darkGreen = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0) // Koyu yeşil
            let darkYellow = UIColor(red: 0.8, green: 0.8, blue: 0.0, alpha: 1.0) // Koyu sarı
            
            gradientLayer.colors = [
                darkGreen.cgColor, // Yeşil renk
                darkYellow.cgColor // Sarı renk
            ]
            gradientLayer.locations = [0.0, 1.0] // Başlangıç ve bitiş noktaları
            
            self.contentView.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            // Gradient layer'ın frame'ini güncelle
            if let gradientLayer = self.contentView.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.frame = self.bounds
            }
        }
    
}
