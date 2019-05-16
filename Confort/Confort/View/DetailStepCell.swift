//
//  DetailStepCell.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 14/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class DetailStepCell: UITableViewCell{
    @IBOutlet weak var stepTitle: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    weak var delegate: ButtonSelectedDelegate?
    
    @IBAction func liked(_ sender: UIButton) {
        delegate?.buttonTapped(sender: stepTitle.text!)
        sender.showsTouchWhenHighlighted = true
        if sender.tag == 0{
            sender.setBackgroundImage(UIImage(named: "Step Completion #1 2"), for: .normal)
            sender.tag = 1
        }else{
            sender.setBackgroundImage(UIImage(named: "Open Step 2"), for: .normal)
            sender.tag = 0
        }
    }
    
}


protocol ButtonSelectedDelegate: class {
    func buttonTapped(sender: String)
}
