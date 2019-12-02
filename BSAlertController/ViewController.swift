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
		show(alert: BSAlert(type: .optional,
							title: .error,
							message: "GOGO",
							confirmButtonText: "下次",
							cancelButtonText: "不要",
							shouldAnimateIn: true,
							shouldAnimateOut: false,
							confirm: { print("confirm pressed") },
							cancel: { print("cancel") }))
    }
}

