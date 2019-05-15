//
//  StepsSecondCell.swift
//  Confort
//
//  Created by Giulia Ferraro on 14/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class StepsSecondCell: UITableViewCell {

    @IBOutlet weak var stepsTextField: UITextField!
    
    @IBAction func addStep(_ sender: Any) {
        stepsTextField.endEditing(true)
        stepsTextField.text?.removeAll()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stepsTextField.placeholder = "What is the next step to achieve your goal?"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
