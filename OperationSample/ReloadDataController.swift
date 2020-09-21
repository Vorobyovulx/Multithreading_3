//
//  ReloadDataController.swift
//  OperationSample
//
//  Created by Mad Brains on 25.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import Foundation

class ReloadDataController: Operation {
    
    var controller: ViewController
    
    init(controller: ViewController) {
        self.controller = controller
    }
    
    override func main() {
        guard let parseData = dependencies.first as? ParseData else {
            return
        }
        
        controller.posts = parseData.output
        controller.tableView.reloadData()
    }
    
}
