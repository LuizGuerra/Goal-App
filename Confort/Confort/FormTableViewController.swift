//
//  FormTableViewController.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 08/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    private var dateCellExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // For removing the extra empty spaces of TableView below
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if dateCellExpanded {
                dateCellExpanded = false
            } else {
                dateCellExpanded = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if dateCellExpanded {
                return 250
            } else {
                return 50
            }
        }
        return 50
    }
}
