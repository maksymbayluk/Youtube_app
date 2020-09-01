//
//  Constants.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 29.08.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyCdevYtUA_biECjQcWjPgzXOFsrxb64vFA"
    static var PLAYLIST_ID = "PL0KWAvKzASSf5KzqdxlS8qqYjsc4h_swZ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELLID = "VideoCell"
}
