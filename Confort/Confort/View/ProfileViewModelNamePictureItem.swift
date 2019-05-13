//
//  ProfileViewModelNamePictureItem.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 08/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var isCollapsed = true
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
    var isCollapsible: Bool { get }
    var isCollapsed: Bool { get set }
}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
    
    var isCollapsible: Bool {
        return true
    }
}
