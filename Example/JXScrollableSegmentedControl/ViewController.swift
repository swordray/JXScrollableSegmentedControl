//
//  ViewController.swift
//  JXScrollableSegmentedControl
//
//  Created by swordray on 12/20/2020.
//  Copyright (c) 2021 swordray. All rights reserved.
//

import JXScrollableSegmentedControl

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let segmentedControl = JXScrollableSegmentedControl(items: ["Scrollable", "segmented", "control", "with", "unlimited", "segments"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

