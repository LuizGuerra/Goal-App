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
    
    let goals: [Goal] = [
    Goal(title: "Change professional career", description: "I'm not satisfied with my professional carrer. I know people that are following their dreams, putting their faces out there and i believe i have the strength to do so as well. I have to give it a shot!", step: [
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: false),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: false),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: false),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: false),
        Step(name: "Primeiro passo", isCompleted: false),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: false),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Primeiro passo", isCompleted: true),
        Step(name: "Segundo passo", isCompleted: true)]),
    Goal(title: "Quero parar de fumar", description: "Preciso parar de fumar por conta da minha saúde", step: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: []),
    Goal(title: "Outro objetivo", description: "Quero muito atingir esse objetivo", step: []),
    Goal(title: "Algum outro objetivo", description: "Quero muito atingir esse objetivo", step: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: []),
    Goal(title: "Outro objetivo", description: "Quero muito atingir esse objetivo", step: []),
    Goal(title: "Algum outro objetivo", description: "Quero muito atingir esse objetivo", step: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: []),
    Goal(title: "Outro objetivo", description: "Quero muito atingir esse objetivo", step: []),
    Goal(title: "Algum outro objetivo", description: "Quero muito atingir esse objetivo", step: [])]
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
        if segue.identifier == "showDetails", let detailVC = segue.destination as? GoalDetail, let selectedInfo = sender as? Goal{
            detailVC.goal = selectedInfo
            
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
        return 100
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
        cell.goalProgressBar.progress = Float(progressionStatus(goal: goal))
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

