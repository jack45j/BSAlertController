//
//  BSAlert.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import Foundation

/// Alert object for BSAlertController.
public struct BSAlert {
    
	/// Determine the style of alert.
	/// Default to confirm
    public enum BSAlertType {
		/// Alert view will contains only one confirm button.
        case confirm
		
		/// Alert view will contains confirm and cancel buttons.
        case optional
    }
    
    /// Determine the title of the alert view
    /// Default to warning
    public enum BSAlertTitleType: String {
        case info = "資訊"
        case warning = "注意"
        case error = "錯誤"
    }
    
    /// Alert Type of BSAlert.
    /// Default to warning alert type
    let alertType: BSAlertType?
    
    /// Title of alert
    /// Default to warning alert title type.
    let title: String
    
    /// Message of alert.
    let message: String
    
    /// Text of confirm button.
    let confirmButtonText: String?
    
    /// Text of cancel button.
    let cancelButtonText: String?
    
    /// A Boolean value indicating whether alert view should perform animate or not.
    let shouldAnimateIn: Bool
    let shouldAnimateOut: Bool
    
    /// Action handler of confirm and cancel button.
    let confirm: AlertActionHandler?
    let cancel: AlertActionHandler?
    
    init(type: BSAlertType = .confirm,
         title: BSAlertTitleType = .warning,
         message: String,
         confirmButtonText: String = "確定",
         cancelButtonText: String = "取消",
         shouldAnimateIn: Bool = true,
         shouldAnimateOut: Bool = true,
         confirm: AlertActionHandler?,
         cancel: AlertActionHandler? = nil) {
        
        self.alertType = type
        self.title = title.rawValue
        self.message = message
        self.shouldAnimateIn = shouldAnimateIn
        self.shouldAnimateOut = shouldAnimateOut
        self.confirmButtonText = confirmButtonText
        self.cancelButtonText = cancelButtonText
        self.confirm = confirm
        self.cancel = cancel
    }
}
