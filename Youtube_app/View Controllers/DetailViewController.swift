//
//  DetailViewController.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 04.09.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
//        check if there is a video
        guard video != nil else {
            return
        }
//        create the embed URL
        let embedUrl = Constants.YT_EMBED_URL + video!.videoId
        
//        load video to webview
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        
//        set the title
        titleLabel.text = video!.title
//        set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
//        set the description
        textView.text = video!.description
    }


}
