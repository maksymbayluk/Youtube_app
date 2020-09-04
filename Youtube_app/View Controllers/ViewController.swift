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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else{
            return
        }
//        get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
//        get a reference to detail view controller
        let detailVC = segue.destination as! DetailViewController
//        set the video property of detail view controller
        detailVC.video = selectedVideo
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELLID, for: indexPath) as! VideoTableViewCell
//        Configure the cell with the data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
//        return the cell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

