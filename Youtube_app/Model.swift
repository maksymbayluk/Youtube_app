//
//  Model.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 29.08.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}
class Model {
    
    var delegate:ModelDelegate?
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
            do {
                //            parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil {
                    DispatchQueue.main.async {
                        //                    call the "videosReturned" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
//
//                dump(response)
            }
            catch {
                
            }
        }
//        kick off the task
        dataTask.resume()
    }
}
