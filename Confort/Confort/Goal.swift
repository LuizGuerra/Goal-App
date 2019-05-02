//
//  Task.swift
//  Confort
//
//  Created by Giulia Ferraro on 30/04/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import Foundation
import UIKit

struct Goal {
    var title: String
    var description: String
    var step: [Step]
    var color: UIColor
    var priority: Int
    var start: Date
    var end: Date
    var typeOfGoal: TypeOfGoal
    //var graphs: Graph
    var notification: Bool
    var categories: [String]
}
