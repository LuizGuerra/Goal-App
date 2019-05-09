//
//  NewGoalFirstPage.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 02/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class NewGoalFirstPage: ViewController{
    @IBOutlet weak var priorityBar: UISlider!
    @IBOutlet weak var goalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        priorityBar.setAppSliderDefaults()
    }
}

