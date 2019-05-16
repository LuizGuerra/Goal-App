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
    @IBOutlet weak var disableSlider: CustomSlider!
	lazy var goalHolderLabel: UILabel? = view.viewWithTag(10) as? UILabel

    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableSlider.isEnabled = false
//        self.changeTabBarCollorToWhite()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        priorityBar.setAppSliderDefaults()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.changeTabBarCollorToGradient()
        super.viewWillDisappear(animated)
    }
}

