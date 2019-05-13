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
    var step: [String]
    var color: UIColor
    var priority: Int
    var progression: Float
    var typeOfGoal: TypeOfGoal
    var notification: Bool
    var categories: [String]
}
