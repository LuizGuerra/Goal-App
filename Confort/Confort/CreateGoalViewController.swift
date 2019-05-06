//
//  CreateGoalViewController.swift
//  Confort
//
//  Created by Giulia Ferraro on 03/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var typePicker: UIPickerView!
    
    var pickerTypeData = ["None","Family","Exercise","Health","Professional","Love","Learn","Be Thankful"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        typePicker.delegate = self
        typePicker.dataSource = self
        typePicker.reloadAllComponents()
        titleTextField.layer.cornerRadius = 6.67;
        descriptionTextView.layer.cornerRadius = 14;
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTypeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTypeData[row]
    }
    
}
