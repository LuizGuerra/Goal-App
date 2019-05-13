//
//  GoalCell.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 30/04/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class GoalCellMinimized: UITableViewCell{
    @IBOutlet weak var titleGoal: UILabel!
    @IBOutlet weak var goalProgressBar: UIProgressView!
    var goal: Goal?
    var isExpanded: Bool = false
}
