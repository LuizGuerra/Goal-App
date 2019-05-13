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
    var steps = ["Skdjsl jdskflkjs kdjfdm", "Jdklljs sdkjfks sdjfks", "KJkjsdsljf ksdfkj ksdfj", "KJjdskjsdj skdjflk skdlkdf", "HKJBjshdfj jdshfksj"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepsTableView.dataSource = self
        stepsTableView.delegate = self
        // Do any additional setup after loading the view.
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
            guard let cell = stepsTableView.dequeueReusableCell(withIdentifier: "StepsSecondCell") else { fatalError() }
            
            return cell
        } else {
            
            guard let cell = stepsTableView.dequeueReusableCell(withIdentifier: "StepsFirstCell") as? StepsFirstCell else { return UITableViewCell() }
            
            cell.labelSteps.text = steps[indexPath.row]
            let image = UIImage(named: "Group 2")
            cell.stepsImageView.image = image
            
            return cell
            
        }
        
    }
    
    
}

extension EnableStepCreation : UITableViewDelegate {
    
}
