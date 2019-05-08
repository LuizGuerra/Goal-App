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
        minimumTrackTintColor = SliderTheme.sliderBlueGreenColor
        maximumTrackTintColor = SliderTheme.sliderGrayColor
        thumbTintColor = SliderTheme.sliderBlueGreenColor
        frame.origin = CGPoint(x: frame.minX, y: frame.minY + 12)
        //frame.minY += 10
        
        // setting sizes
        //setThumbImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        //setThumbImage( ---- , for: .highlighted)
        
    }

}

class CustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: 7))
    }
    
    
    
}
