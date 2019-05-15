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
        
        self.titleTextField.addShadowToView()
        self.descriptionTextView.addShadowToView()
        self.typePicker.addShadowToView()
        
        self.changeTabBarCollorToWhite()

        typePicker.delegate = self
        typePicker.dataSource = self
        typePicker.reloadAllComponents()
        titleTextField.layer.cornerRadius = 6.67;
        descriptionTextView.layer.cornerRadius = 14;
//        descriptionTextView.delegate = self
        
       
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? EnableStepCreation, let title = titleTextField.text, !title.isEmpty {
            let goal = Goal(title: title, description: descriptionTextView.text, step: [])
            nextVC.goal = goal
        }
        
    }
    
}


extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension CreateGoalViewController : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }
}

