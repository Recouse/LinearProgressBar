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
    var firstProgressBar: LinearProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        prepareNavigationController()
        
        showProgressBar()
        
        prepareDemoProgressBars()
    }
}

extension ViewController {
    func prepareNavigationController() {
        navigationItem.title = "Loading..."
    }
    
    func prepareDemoProgressBars() {
        firstProgressBar = LinearProgressBar()
        firstProgressBar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        firstProgressBar.progressBarColor = .systemOrange
        firstProgressBar.progressBarWidth = 5
        firstProgressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstProgressBar)
        firstProgressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        firstProgressBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        firstProgressBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        firstProgressBar.startAnimating()
    }
}

