//
//  CacheManager.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 02.09.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import Foundation
class CacheManager {
    static var cache = [String:Data]()
    static func setVideoCache(_ url:String, _ data:Data?) {
//        Store the imagedata and use the url as the key
        cache[url] = data
    }
    static func getVideoCache(_ url:String) -> Data? {
//        try to get the data for the specified url
        return cache[url]
    }
}
