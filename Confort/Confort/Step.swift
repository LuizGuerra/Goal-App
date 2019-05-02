//
//  Step.swift
//  Confort
//
//  Created by Giulia Ferraro on 02/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import Foundation

struct Step: Temporal, Money, Geographic{
    var stepId: Int
    var name: String
    var description: String
    var start: Date
    var end: Date
    var isCompleted: Bool
}
