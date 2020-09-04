//
//  VideoTableViewCell.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 01.09.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    var video:Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(_ v:Video) {
//        ensure that we have video
        guard self.video != nil else{
            return
        }
        self.video = v
//        set the title and date label
        self.titleLabel.text = video?.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        guard self.video!.thumbnail != "" else {
            return
        }
//        Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
//            Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
//        download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
//                Save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
//                check the downloaded url
                if url!.absoluteString != self.video?.thumbnail {
//                    video cell has been recycled for another video
//                    and no longer matches the thumbnail that was downloaded
                    return
                }
//                Create the image object
                let image = UIImage(data: data!)
//                set the imageview
                self.thumbnailImageView.image = image
                
            }
            
    }
//        start data task
        dataTask.resume()
 }
}
