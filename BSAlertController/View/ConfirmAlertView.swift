//
//  ConfirmAlertView.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import UIKit

class ConfirmAlertView: UIView {
    @IBOutlet weak var confirmButton: UIButton!
    @IBAction func confirmButtonTap(_ sender: Any) {
        BSAlertViewController.shared.confirmHandler()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
