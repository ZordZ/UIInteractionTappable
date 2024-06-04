//
//  Module: UIInteractionTappable
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//


import Combine
import UIKit
import CloudKit

public protocol UIInteractionSubscribable: AnyObject {
    func attach(target: Any?, action: Selector, for controlEvents: UIControl.Event)
    func detach(target: Any?, action: Selector?, for controlEvents: UIControl.Event)
}

// MARK: - UIControl

extension UIControl: UIInteractionSubscribable {
    public func attach(target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        addTarget(target, action: action, for: controlEvents)
    }
    
    public func detach(target: Any?, action: Selector?, for controlEvents: UIControl.Event) {
        removeTarget(target, action: action, for: controlEvents)
    }
}

// MARK: - UIBarButtonItem

extension UIBarButtonItem: UIInteractionSubscribable {
    public func attach(target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        self.target = target as AnyObject?
        self.action = action
    }
    
    public func detach(target: Any?, action: Selector?, for controlEvents: UIControl.Event) {
        self.target = nil
        self.action = nil
    }
}
