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
    lazy var goalHolderLabel: UILabel? = view.viewWithTag(10) as? UILabel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

