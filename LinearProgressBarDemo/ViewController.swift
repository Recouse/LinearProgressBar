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
    var toggleProgessBarItem: UIBarButtonItem!
    
    var isLoading: Bool = false
    
    let firstProgressBar: LinearProgressBar = {
        let progressBar = LinearProgressBar()
        progressBar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        progressBar.progressBarColor = .systemOrange
        progressBar.progressBarWidth = 5
        progressBar.cornerRadius = 4
        
        return progressBar
    }()
    
    let secondProgressBar: LinearProgressBar = {
        let progressBar = LinearProgressBar()
        progressBar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        progressBar.progressBarColor = .systemGreen
        progressBar.progressBarWidth = 5
        progressBar.cornerRadius = 4
           
        return progressBar
    }()
    
    let thirdProgressBar: LinearProgressBar = {
        let progressBar = LinearProgressBar()
        progressBar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        progressBar.progressBarColor = .systemPurple
        progressBar.progressBarWidth = 5
        progressBar.cornerRadius = 4
           
        return progressBar
    }()
    
    lazy var progressBarsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.firstProgressBar, self.secondProgressBar, self.thirdProgressBar
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 40
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        prepareNavigationItem()
        toggleProgressBar()
        
        prepareDemoProgressBars()
        startAnimating()
    }
    
    func startAnimating() {
        [firstProgressBar, secondProgressBar, thirdProgressBar].forEach {
            $0.startAnimating()
        }
    }
    
    func stopAnimating() {
        [firstProgressBar, secondProgressBar, thirdProgressBar].forEach {
            $0.stopAnimating()
        }
    }
    
    @objc func toggleProgressBar() {
        isLoading.toggle()
        
        if isLoading {
            toggleProgessBarItem.title = "Hide"
            showProgressBar()
        } else {
            toggleProgessBarItem.title = "Show"
            hideProgressBar()
        }
    }
}

extension ViewController {
    func prepareNavigationItem() {
        navigationItem.title = "LinearProgressBar Demo"
        
        toggleProgessBarItem = UIBarButtonItem(
            title: "Show",
            style: .plain,
            target: self, action: #selector(toggleProgressBar)
        )
        navigationItem.rightBarButtonItem = toggleProgessBarItem
    }
    
    func prepareDemoProgressBars() {
        progressBarsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBarsStackView)
        progressBarsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        progressBarsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        progressBarsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
}

