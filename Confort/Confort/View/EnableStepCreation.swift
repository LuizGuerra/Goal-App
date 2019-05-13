//
//  EnableStepCreation.swift
//  Confort
//
//  Created by Giulia Ferraro on 09/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class EnableStepCreation: UIViewController {

    @IBOutlet weak var enableSlider: CustomSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        enableSlider.setAppSliderBlue()
    }
}
