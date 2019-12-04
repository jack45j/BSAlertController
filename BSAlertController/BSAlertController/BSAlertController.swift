//
//  BaseAlertController.swift
//  BSAlertController
//
//  Created by Chinalife on 2019/12/2.
//  Copyright © 2019 YochaStudio. All rights reserved.
//

import UIKit

public typealias AlertActionHandler = (() -> Void)

/// The BSAlertController class
public class BSAlertController: UIViewController {
    
    /// The BSAlertController singleton. The main pointof entry to this BSAlertController library.
    public static let shared = BSAlertController()
    
	/// A list contains alert objects which are prepare to display.
    public var displayQueue = [BSAlert]() {
        didSet {
			if isReadyToActive { displayNextAlert() }
        }
    }
	
	/// The action handler used to excute the code
    private var confirm: AlertActionHandler?
    private var cancel: AlertActionHandler?
	
	/// The alert view which is currently presenting.
	private var currentAlertView: BSAlert?
	
	/// A Boolean value indicating whether there is any alert view is showing.
    private var isShowing: Bool = false
	
	/// A Boolean value indicating whether AlertView is not in present or dismiss progress and has ready to active.
	private var isReadyToActive: Bool = true
    
    /// insert a new alert object to display queue's first index.
    private func addNewAlert(_ alert: BSAlert) {
        displayQueue.insert(alert, at: 0)
    }
    
    /// Start to display next alert view.
	private func displayNextAlert() {
        if !isShowing {
			guard let alert = displayQueue.first else { return }
			currentAlertView = alert
			switch (self.currentAlertView?.alertType ?? .confirm) {
			case .confirm:
				showConfirmAlert()
			case .optional:
				showOptionalAlert()
			}
		} else {
			dismissCurrentAlertViewTemporary()
		}
    }
	
	/// Dismiss alert view without remove it from display queue.
	private func dismissCurrentAlertViewTemporary() {
		isReadyToActive = false
		self.dismiss(animated: false, completion: { [weak self] in
			self?.isReadyToActive = true
            self?.isShowing = false
            self?.displayNextAlert()
        })
    }
	
	/// Dismiss alert view and remove it from display queue.
	private func dismissAlertView() {
        guard let alert = currentAlertView else { return }
		isReadyToActive = false
        self.dismiss(animated: alert.shouldAnimateOut, completion: { [weak self] in
			self?.isReadyToActive = true
			self?.isShowing = false
			self?.displayQueue.removeFirst()
        })
    }
    
    /// Show alert view with one confirm button.
    private func showConfirmAlert() {
        guard
            let confirmAlertView = Bundle.main.loadNibNamed("ConfirmAlertView", owner: nil, options: nil)?.first as? ConfirmAlertView,
            let currentAlert = currentAlertView
        else { return }
        
        confirmAlertView.alertObject = currentAlert
        
        self.view.addSubview(setupBlurBackGroundView(with: confirmAlertView))
        
        self.confirm = currentAlert.confirm
        isShowing = true
        UIApplication.topViewController()?.present(self, animated: currentAlert.shouldAnimateIn, completion: nil)
    }
    
    
    ///  Show alert View with confirm and cancel buttons.
    private func showOptionalAlert() {
        guard
            let optionalAlertView = Bundle.main.loadNibNamed("OptionalAlertView", owner: nil, options: nil)?.first as? OptionalAlertView,
            let currentAlert = currentAlertView
        else { return }
        
        optionalAlertView.alertObject = currentAlert
        
        self.view.addSubview(setupBlurBackGroundView(with: optionalAlertView))

        self.confirm = currentAlert.confirm
        self.cancel = currentAlert.cancel
        isShowing = true
        UIApplication.topViewController()?.present(self, animated: currentAlert.shouldAnimateIn, completion: nil)
    }
    
    /// /// This method initial and return an UIVisualEffectView with blur effect.
    ///
    /// - Parameters:
    ///     - subView : The view that will add to blur view's content view
    ///     - style : The blur effect style that will apply to the blur view.
    private func setupBlurBackGroundView(with subView: UIView, style: UIBlurEffect.Style = .dark) -> UIVisualEffectView {
        var blurBackGroundView: UIVisualEffectView
        let blurEffect = UIBlurEffect(style: style)
        blurBackGroundView = UIVisualEffectView(effect: blurEffect)
        blurBackGroundView.frame.size = UIScreen.main.bounds.size
        blurBackGroundView.contentView.addSubview(subView)
        
        return blurBackGroundView
    }
    
	/// Action handler of confirm button.
    public func confirmHandler() {
        confirm?()
        dismissAlertView()
    }
	
	/// Action handler of cancel button.
    public func cancelHandler() {
        cancel?()
        dismissAlertView()
    }
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    /// setup view and settings while init.
    private func setupViews() {
        self.modalPresentationStyle = .custom
		self.modalTransitionStyle = .crossDissolve
    }
}


// MARK: - public API Interface
//
public extension BSAlertController {
    
    func show(_ alert: BSAlert) {
        BSAlertController.shared.addNewAlert(alert)
    }
    
    func show(message: String, confirm: AlertActionHandler?) {
        let alert = BSAlert(message: message, confirm: confirm)
        BSAlertController.shared.addNewAlert(alert)
    }
    
    func showOptional(message: String, confirm: AlertActionHandler?, cancel: AlertActionHandler?) {
        let alert = BSAlert(type: .optional, message: message, confirm: confirm, cancel: cancel)
        BSAlertController.shared.addNewAlert(alert)
    }
    
    func show(message: String) {
        let alert = BSAlert(message: message, confirm: nil)
        BSAlertController.shared.addNewAlert(alert)
    }
    
    func showError(message: String) {
        let alert = BSAlert(title: .error, message: message, confirm: nil)
        BSAlertController.shared.addNewAlert(alert)
    }
}


extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
