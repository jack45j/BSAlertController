//
//  BSAlert.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import Foundation


public struct BSAlert {
    
    public enum BSAlertType {
        case confirm
        case optional
    }
    
    /// Determine the title of the alert view
    public enum BSAlertTitleType: String {
        case info = "資訊"
        case warning = "注意"
        case error = "錯誤"
    }
    
    /// Alert Type of BSAlert.
    ///
    /// Default to warning alert type
    let alertType: BSAlertType?
    
    let title: String
    
    /// Alert messages
    let message: String
    
    let confirmButtonText: String?
    
    let cancelButtonText: String?
    
    let shouldAnimateIn: Bool
    let shouldAnimateOut: Bool
    
    let confirm: ConfirmAlertHandler?
    let cancel: ConfirmAlertHandler?
    
    init(type: BSAlertType = .confirm,
         title: BSAlertTitleType = .warning,
         message: String,
         confirmButtonText: String = "確定",
         cancelButtonText: String = "取消",
         shouldAnimateIn: Bool = true,
         shouldAnimateOut: Bool = true,
         confirm: ConfirmAlertHandler?,
         cancel: ConfirmAlertHandler? = nil) {
        
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
