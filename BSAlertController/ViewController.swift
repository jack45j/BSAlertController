//
//  ViewController.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonDidTap(_ sender: Any) {
		for ind in 0...100 {
            BSAlertController.shared.show(BSAlert(type: .confirm,
								title: .error,
								message: "\(ind)",
								confirmButtonText: "Confirm\(ind)",
								cancelButtonText: "Cancel\(ind)",
								shouldAnimateIn: ind % 2 == 0,
								shouldAnimateOut: ind % 3 == 0,
								confirm: { print("confirm pressed \(ind)") },
								cancel: { print("Cancel pressed \(ind)") }))
		}
    }
}

