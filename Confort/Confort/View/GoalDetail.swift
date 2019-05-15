//
//  GoalDetail.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 14/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class GoalDetail: UIViewController{
    @IBOutlet weak var stepTableView: UITableView!
    var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepTableView.dataSource = self
        stepTableView.rowHeight = UITableView.automaticDimension
        stepTableView.estimatedRowHeight = 100
        stepTableView.delegate = self
        stepTableView.separatorStyle = .none
    }
}

extension GoalDetail: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goal?.step.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = stepTableView.dequeueReusableCell(withIdentifier: "DetailGoalCell") as? DetailGoalCell else{
            return UITableViewCell()
        }
        
        cell.progressStatus.progress = goal!.progression
        cell.progressStatus.progressTintColor = BarThemes.sliderBlueGreenColor
        cell.progressStatus.trackTintColor = BarThemes.sliderGrayColor
        cell.progressStatus.transform = CGAffineTransform(scaleX: 1, y:5)
        cell.progressStatus.layer.cornerRadius = 8
        cell.progressStatus.clipsToBounds = true
        cell.progressStatus.layer.sublayers![1].cornerRadius = 8
        cell.progressStatus.subviews[1].clipsToBounds = true
        cell.title.text = goal?.title
        cell.descriptionGoal.text = goal?.description
        return cell
    }
    
//    func progressionStatus(goal: Goal) -> Double{
//        let completed = 0
//        for step in goal.step {
//            if
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = stepTableView.dequeueReusableCell(withIdentifier: "DetailStepCell") as? DetailStepCell else{
            return UITableViewCell()
        }
        print(indexPath)
        cell.stepTitle.text = goal?.step[indexPath[1]]
        return cell
    }
}
