//
//  NewGoalFirstPage.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 02/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class NewGoalFirstPage: UIViewController{
    @IBOutlet weak var priorityBar: UISlider!
//    @IBOutlet weak var goalLabel: UILabel!
    lazy var goalHolderLabel: UILabel? = view.viewWithTag(10) as? UILabel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let aux = self.goalLabel {
//            goalLabel.adjustsFontSizeToFitWidth = true
//        }
//        goalHolderLabel.adjustsFontSizeToFitWidth = true
        print("View Did Load")
//        print(view.subviews.last!.subviews.first!.subviews.first!)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(goalHolderLabel)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        priorityBar.setAppSliderDefaults()
//    }
}

