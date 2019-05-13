//
//  GoalCellExpanded.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 09/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class GoalCellExpanded: UITableViewCell{
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalProgressBar: UIProgressView!
    @IBOutlet weak var goalDescription: UILabel!
    var goal: Goal?
}
