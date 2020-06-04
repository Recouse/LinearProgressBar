//
//  ViewController.swift
//  LinearProgressBarDemo
//
//  Created by Firdavs Khaydarov on 16/03/18.
//  Copyright © 2018 Firdavs Khaydarov. All rights reserved.
//

import UIKit
import LinearProgressBar

class ViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        prepareNavigationController()
        
        let view = showProgressBar(5)
        
    }
}

extension ViewController {
    func prepareNavigationController() {
        navigationItem.title = "Loading..."
    }
}

