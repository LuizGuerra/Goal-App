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
    @IBOutlet weak var stepsTableView: UITableView!
    var steps: [Step] = []
    var goal: Goal? 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    static var createdGoal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepsTableView.dataSource = self
        stepsTableView.delegate = self
        titleLabel.text = goal?.title
        descriptionLabel.text = goal?.description
        // Do any additional setup after loading the view.
    }
    @IBAction func checkPressed(_ sender: UIBarButtonItem) {
        
//        performSegue(withIdentifier: "unwindToHome",
//                     sender: goal)
        goal?.step = steps
        EnableStepCreation.createdGoal = goal
        self.navigationController?.popToRootViewController(animated: true)
        
        print("Here")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? GoalPage {
            let goals = Goal(title: goal!.title, description: goal!.description, step: goal!.step)
            nextVC.goal = goals
        }
    }
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        enableSlider.setAppSliderBlue()
    }
}

extension EnableStepCreation : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == steps.count {
            guard let cell = stepsTableView.dequeueReusableCell(withIdentifier: "StepsSecondCell") as? StepsSecondCell else { fatalError() }
            cell.stepsTextField.delegate = self
            
            return cell
        } else {
            
            guard let cell = stepsTableView.dequeueReusableCell(withIdentifier: "StepsFirstCell") as? StepsFirstCell else { return UITableViewCell() }
            
            cell.labelSteps.text = steps[indexPath.row].name
            let image = UIImage(named: "Group 2")
            cell.stepsImageView.image = image
            
            return cell
            
        }
        
    }
    
    
}

extension EnableStepCreation : UITableViewDelegate {
    
}

extension EnableStepCreation : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        steps.append(Step(name: textField.text!, isCompleted: false))
        stepsTableView.reloadData()
    }
}
