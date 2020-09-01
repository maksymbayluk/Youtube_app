//
//  ViewController.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 27.08.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        set itself as datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
//        set itself as the delegate of the model
        model.delegate = self
        model.getvideos()

    }
//    MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
//        set the returned videos to video property
        self.videos = videos
//        refresh the tableView
        tableView.reloadData()
    }
//    MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELLID, for: indexPath)
//        Congigure the cell with the data
//        get the video title in question
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
//        return the cell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

