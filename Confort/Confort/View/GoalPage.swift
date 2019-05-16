//
//  GoalPage.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 30/04/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class GoalPage: UIViewController {
    @IBOutlet weak var goalTableView: UITableView!
    @IBOutlet weak var addGoal: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeTabBarCollorToGradient()
        goalTableView.dataSource = self
        goalTableView.rowHeight = UITableView.automaticDimension
        goalTableView.estimatedRowHeight = 100
        goalTableView.delegate = self
        goalTableView.separatorStyle = .none
    }
    
    var goals: [Goal] = [
    Goal(title: "Change professional career", description: "I'm not satisfied with my professional career. I know people that are following their dreams, putting their faces out there and i believe i have the strength to do so as well. I have to give it a shot!", step: [
        Step(name: "2", isCompleted: false),
        Step(name: "3", isCompleted: false),
        Step(name: "4", isCompleted: false),
        Step(name: "5", isCompleted: false),
        Step(name: "6", isCompleted: false),
        Step(name: "7", isCompleted: false),
        Step(name: "8", isCompleted: false),
        Step(name: "9", isCompleted: false),
        Step(name: "10", isCompleted: false),
        Step(name: "11", isCompleted: false),
        Step(name: "12", isCompleted: false),
        Step(name: "13", isCompleted: false),
        Step(name: "14", isCompleted: false),
        Step(name: "15", isCompleted: false),
        Step(name: "16", isCompleted: false),
        Step(name: "17", isCompleted: false)], color: .clear, priority: 10, progression: 0.0, typeOfGoal: .money, notification: true, categories: []),Goal(title: "Começar um curso de francês", description: "I'm not satisfied with my professional career. I know people that are following their dreams, putting their faces out there and i believe i have the strength to do so as well. I have to give it a shot!", step: [
            Step(name: "2", isCompleted: false),
            Step(name: "3", isCompleted: false),
            Step(name: "4", isCompleted: false),
            Step(name: "5", isCompleted: false),
            Step(name: "6", isCompleted: false),
            Step(name: "7", isCompleted: false),
            Step(name: "8", isCompleted: false),
            Step(name: "9", isCompleted: false),
            Step(name: "10", isCompleted: false),
            Step(name: "11", isCompleted: false),
            Step(name: "12", isCompleted: false),
            Step(name: "13", isCompleted: false),
            Step(name: "14", isCompleted: false),
            Step(name: "15", isCompleted: false),
            Step(name: "16", isCompleted: false),
            Step(name: "17", isCompleted: false)], color: .clear, priority: 10, progression: 0.0, typeOfGoal: .money, notification: true, categories: []),
        Goal(title: "Perder peso", description: "I'm not satisfied with my professional career. I know people that are following their dreams, putting their faces out there and i believe i have the strength to do so as well. I have to give it a shot!", step: [
            Step(name: "2", isCompleted: false),
            Step(name: "3", isCompleted: false),
            Step(name: "4", isCompleted: false),
            Step(name: "5", isCompleted: false),
            Step(name: "6", isCompleted: false),
            Step(name: "7", isCompleted: false),
            Step(name: "8", isCompleted: false),
            Step(name: "9", isCompleted: false),
            Step(name: "10", isCompleted: false),
            Step(name: "11", isCompleted: false),
            Step(name: "12", isCompleted: false),
            Step(name: "13", isCompleted: false),
            Step(name: "14", isCompleted: false),
            Step(name: "15", isCompleted: false),
            Step(name: "16", isCompleted: false),
            Step(name: "17", isCompleted: false)], color: .clear, priority: 10, progression: 0.0, typeOfGoal: .money, notification: true, categories: [])]
}

extension GoalPage: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
//    SEGUE FOR DETAILS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = goals[indexPath[1]]
        self.performSegue(withIdentifier: "showDetails", sender: info)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails", let detailVC = segue.destination as? GoalDetail, let selectedInfo = sender as? Goal {
            detailVC.goal = selectedInfo
            detailVC.delegate2 = self
            
        }
    }
//    END SEGUE FOR DETAILS
    
    func progressionStatus(goal: Goal) -> Double{
        var completed = 0.0
        for step in goal.step {
            if step.isCompleted == true{
                completed += 1
            }
        }
        let total = completed / Double(goal.step.count)
        
        return total
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = goalTableView.dequeueReusableCell(withIdentifier: "GoalCellMinimized") as? GoalCellMinimized else{
            return UITableViewCell()
        }
        let goal = goals[indexPath[1]]
        cell.card.addShadowToView()
        cell.goal = goal
        cell.card.layer.cornerRadius = 20.0
        cell.card.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if goal.step.count == 0 {
            cell.goalProgressBar.progress = 0.0
        }else{
            cell.goalProgressBar.progress = Float(progressionStatus(goal: goal))
        }
        cell.goalProgressBar.progressTintColor = BarThemes.sliderBlueGreenColor
        cell.goalProgressBar.trackTintColor = BarThemes.sliderGrayColor
        cell.goalProgressBar.transform = CGAffineTransform(scaleX: 1, y:5)
        cell.goalProgressBar.layer.cornerRadius = 8
        cell.goalProgressBar.clipsToBounds = true
        cell.goalProgressBar.layer.sublayers![1].cornerRadius = 8
        cell.goalProgressBar.subviews[1].clipsToBounds = true
        cell.titleGoal.text = goal.title
        return cell
    }
}

extension GoalPage: GoalAtualization {
    func goalAtualization(goal: Goal) {
        var indexes: [IndexPath] = []
        for i in 0 ..< goals.count {
            if goal.title == goals[i].title {
                goals[i] = goal
                indexes.append(IndexPath(row: i, section: 0))
            }
        }
        goalTableView.reloadRows(at: indexes, with: .automatic)
    }
}
