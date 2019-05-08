//
//  UISliderExtension.swift
//  Confort
//
//  Created by Luiz Pedro Franciscatto Guerra on 07/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

extension UISlider {

    func setAppSliderDefaults() {
        
        // setting colors
        minimumTrackTintColor = BarThemes.sliderBlueGreenColor
        maximumTrackTintColor = BarThemes.sliderGrayColor
        thumbTintColor = BarThemes.sliderBlueGreenColor
        frame.origin = CGPoint(x: frame.minX, y: frame.minY + 12)
        
        // setting sizes
        setThumbImage(BarThemes.sliderThumbImage, for: .normal)
        
    }

}

class CustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: 7))
    }
    
    
}
