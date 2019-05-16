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
    var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeTabBarCollorToGradient()
        goalTableView.dataSource = self
        goalTableView.rowHeight = UITableView.automaticDimension
        goalTableView.estimatedRowHeight = 100
        goalTableView.delegate = self
        goalTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        goal = EnableStepCreation.createdGoal
        if (goal?.title != nil && goal?.description != nil && goal?.step != nil){
            goals.append(goal!)
        }
        goalTableView.reloadData()
        
    }
    
    var goals: [Goal] = [
        Goal(title: "Change my career", description: "I'm not satisfied with my professional career. I know people that are following their dreams, putting their faces out there and i believe i have the strength to do so as well. I have to give it a shot!", step: [
            Step(name: "Look for a new course where i really feel good", isCompleted: false),
            Step(name: "Search for entrance exams that offer this course", isCompleted: false),
            Step(name: "Seek information on the labor market", isCompleted: false),
            Step(name: "Get the documentation to present in college", isCompleted: false)]),
        Goal(title: "Adopt a cat", description: "I feel alone at home and would like to adopt a cat to have a company at all times.", step: [
            Step(name: "Search for cats", isCompleted: false),
            Step(name: "Select a name", isCompleted: true),
            Step(name: "Buy a cat house", isCompleted: false),
            Step(name: "Buy a cat scratcher", isCompleted: true),
            Step(name: "Buy cat toys", isCompleted: true)]),
        Goal(title: "Lose weight", description: "I do not feel well today with my body and I know I can change that by keeping my focus", step: [
            Step(name: "Change my alimentation", isCompleted: false),
            Step(name: "Seek academy", isCompleted: true),
            Step(name: "Seek nutritionist", isCompleted: false),
            Step(name: "Seek personal trainer", isCompleted: true)])]
    
    
    
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
