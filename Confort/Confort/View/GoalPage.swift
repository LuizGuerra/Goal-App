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
        goalTableView.dataSource = self
        goalTableView.rowHeight = UITableView.automaticDimension
        goalTableView.estimatedRowHeight = 100
        goalTableView.delegate = self
        goalTableView.separatorStyle = .none
    }
    
    let goals: [Goal] = [
    Goal(title: "Um objetivo", description: "Quero muito atingir esse objetivo", step: ["Primeiro passo", "Segundo passo"], color: .clear, priority: 10, progression: 0.1, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Quero parar de fumar", description: "Preciso parar de fumar por conta da minha saúde", step: [], color: .clear, priority: 10, progression: 0.12, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: [], color: .clear, priority: 10, progression: 0.62, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: [], color: .clear, priority: 10, progression: 0.30, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Outro objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 0.85, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Algum outro objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 1, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: [], color: .clear, priority: 10, progression: 0.62, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: [], color: .clear, priority: 10, progression: 0.30, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Outro objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 0.85, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Algum outro objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 1, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso guardar dinheiro", description: "Caso não guarde 200 reais nesse mês, terminarei no vermelho", step: [], color: .clear, priority: 10, progression: 0.62, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Preciso emagrecer", description: "Preciso perder 15kg no próximo ano", step: [], color: .clear, priority: 10, progression: 0.30, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Outro objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 0.85, typeOfGoal: .money, notification: true, categories: []),
    Goal(title: "Algum outro objetivo", description: "Quero muito atingir esse objetivo", step: [], color: .clear, priority: 10, progression: 1, typeOfGoal: .money, notification: true, categories: [])]
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
            print(selectedInfo.step[0])
        }
    }
//    END SEGUE FOR DETAILS
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = goalTableView.dequeueReusableCell(withIdentifier: "GoalCellMinimized") as? GoalCellMinimized else{
            return UITableViewCell()
        }
        let goal = goals[indexPath[1]]
        cell.goal = goal
        cell.card.layer.cornerRadius = 20.0
        cell.card.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.goalProgressBar.progress = goal.progression
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

