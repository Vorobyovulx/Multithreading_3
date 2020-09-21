//
//  ParseData.swift
//  OperationSample
//
//  Created by Mad Brains on 25.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ParseData: Operation {
    
    var output: [Post] = []
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data,
              let json = try? JSON(data: data)
        else {
            return
        }
        
        let posts: [Post] = json.compactMap {
            let id = $0.1["id"].intValue
            let title = $0.1["title"].stringValue
            let body = $0.1["body"].stringValue
            
            return Post(id: id, title: title, body: body)
        }
        
        output = posts
    }
}
