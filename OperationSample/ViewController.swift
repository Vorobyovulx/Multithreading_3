//
//  ViewController.swift
//  OperationSample
//
//  Created by Mad Brains on 25.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

// https://jsonplaceholder.typicode.com/posts

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = OperationQueue()
        let operation = Operation()
        
        queue.isSuspended = true
        queue.isSuspended = false
        
        queue.cancelAllOperations()
        
        queue.operations
        
        queue.operationCount
        
        queue.waitUntilAllOperationsAreFinished()
        
        
        configureTableView()
        loadData()
    }
    
    func loadData() {
        let request = AF.request("https://jsonplaceholder.typicode.com/posts")
        let queue = OperationQueue()
        
        let getDataOperation = GetDataOperation(request: request)
        queue.addOperation(getDataOperation)
        
        let parseData = ParseData()
        parseData.addDependency(getDataOperation)
        queue.addOperation(parseData)
        
        let reloadController = ReloadDataController(controller: self)
        reloadController.addDependency(parseData)
        
        OperationQueue.main.addOperation(reloadController)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = posts[indexPath.row].title
        cell.detailTextLabel?.text = posts[indexPath.row].body
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
