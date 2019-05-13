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
        minimumTrackTintColor = BarThemes.sliderGrayColor
        maximumTrackTintColor = BarThemes.sliderGrayColor
        thumbTintColor = BarThemes.sliderGrayColor
        
    }
    
    func setAppSliderBlue() {
        
        // setting colors
        minimumTrackTintColor = BarThemes.sliderBlueGreenColor
        maximumTrackTintColor = BarThemes.sliderGrayColor
        thumbTintColor = BarThemes.sliderBlueGreenColor
        
    }

}

class CustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY-3)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 7))
    }

    
    
}
