//
//  User.swift
//  Confort
//
//  Created by Giulia Ferraro on 02/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import Foundation

struct User: HealthOficial {
    var patient: [User]
    var id: Int
    var name: String
    var notificate: Bool
    var notifications: Notification
    var currentGoals: [Goal]
    var completedGoals: [Goal]
    var badges: Int
//    var progress: Graph
}
