//
//  OptionalAlertView.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import UIKit

class OptionalAlertView: UIView {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBAction func confirmButtonTap(_ sender: Any) {
        BSAlertViewController.shared.confirmHandler()
    }
    
    @IBAction func cancelButtonTap(_ sender: Any) {
        BSAlertViewController.shared.cancelHandler()
    }
}
