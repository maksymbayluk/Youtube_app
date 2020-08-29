//
//  Model.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 29.08.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import Foundation

class Model {
    func getvideos() {
//        create url object
        let url = URL(string: Constants.API_URL)
        guard url != nil else{
            return
        }
//        get urlsession object
        let session = URLSession.shared
//        get data task from urlsession object(single call)
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
//            check for errors
            if error != nil || data == nil{
                return
            }
//            parsing the data into video objects
            
        }
//        kick off the task
        dataTask.resume()
    }
}
