//
//  ViewController.swift
//  Youtube_app
//
//  Created by Maxym Bayluk on 27.08.2020.
//  Copyright © 2020 Maxym Bayluk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getvideos()
    }


}

