//
//  ViewControllerExtension.swift
//  Confort
//
//  Created by Luiz Pedro Franciscatto Guerra on 14/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

extension UIViewController {

    func changeTabBarCollorToGradient () {
        if let navBarAppearance = self.navigationController?.navigationBar, let imageForBackground = UIImage(named: "Rectangle 2")
        { navBarAppearance.setBackgroundImage(imageForBackground, for: .default) }
    }
    
    func changeTabBarCollorToWhite () {
        if let navBarAppearance = self.navigationController?.navigationBar {
            navBarAppearance.setBackgroundImage(nil, for: .default)
//            navBarAppearance.barStyle = UIBarStyle.default
        }
    }

}
