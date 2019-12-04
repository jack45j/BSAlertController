//
//  ConfirmAlertView.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import UIKit

class ConfirmAlertView: UIView {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBAction func confirmButtonTap(_ sender: Any) {
        BSAlertController.shared.confirmHandler()
    }
    
	var alertObject: BSAlert?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		setupUI()
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.center = self.superview?.center ?? CGPoint.zero
    }
	
    private func setupUI() {
        self.titleLabel.text = alertObject?.title
        self.messageLabel.text = alertObject?.message
        self.confirmButton.setTitle(alertObject?.confirmButtonText, for: .normal)
    }
}
