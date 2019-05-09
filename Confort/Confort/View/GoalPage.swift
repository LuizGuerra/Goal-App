//
//  GoalPage.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 30/04/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class GoalPage: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var goalTableView: UITableView!
    @IBOutlet weak var addGoal: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTableView.dataSource = self
        goalTableView.rowHeight = 100
        goalTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = goalTableView.dequeueReusableCell(withIdentifier: "prototype") as? GoalCell else{
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        
        cell.goalProgressBar.progress = goal.progression
        cell.goalProgressBar.progressTintColor = BarThemes.sliderBlueGreenColor
        cell.goalProgressBar.trackTintColor = BarThemes.sliderGrayColor
        cell.goalProgressBar.transform = cell.goalProgressBar.transform.scaledBy(x: 1, y: 5)
        cell.goalProgressBar.layer.cornerRadius = 8
        cell.goalProgressBar.clipsToBounds = true
        cell.goalProgressBar.layer.sublayers![1].cornerRadius = 8
        cell.goalProgressBar.subviews[1].clipsToBounds = true
        cell.titleGoal.text = goal.title
        return cell
    }
    
    
    
    let goals: [Goal] = [
    Goal(title: "Um objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 0.1, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Quero parar de fumar", description: "Preciso parar de fumar por conta da minha saúde", step: [], color: .clear, priority: 10, progression: 0.12, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: [], color: .clear, priority: 10, progression: 0.62, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: [], color: .clear, priority: 10, progression: 0.30, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Um objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 0.85, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Um objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 1, typeOfGoal: .money, notification: true, categories: [])]
    
}

