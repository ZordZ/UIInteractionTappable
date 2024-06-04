//
//  Module:
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import Combine
import UIKit

protocol UIGestureSubscribable { }

// MARK: - UITapGestureRecognizer

extension UIGestureRecognizer: UIGestureSubscribable {
    public var publisher: UIGestureRecognizerPublisher {
        switch self {
        case let gesture as UITapGestureRecognizer:
            return UIGestureRecognizerType.tap(gesture).publisher
        case let gesture as UISwipeGestureRecognizer:
            return UIGestureRecognizerType.swipe(gesture).publisher
        case let gesture as UILongPressGestureRecognizer:
            return UIGestureRecognizerType.longPress(gesture).publisher
        case let gesture as UIScreenEdgePanGestureRecognizer:
            return UIGestureRecognizerType.edge(gesture).publisher
        case let gesture as UIPanGestureRecognizer:
            return UIGestureRecognizerType.pan(gesture).publisher
        case let gesture as UIPinchGestureRecognizer:
            return UIGestureRecognizerType.pinch(gesture).publisher
        default:
            return UIGestureRecognizerType.unknown(self).publisher
        }
    }
    
    public typealias OnTapClosure = (UIGestureRecognizerType) -> Void
    public func registerTap(subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        publisher
            .sink(receiveValue: onTapClosure)
            .store(in: &subscriptions)
    }
    
    public convenience init(subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        self.init()
        registerTap(subscriptions: &subscriptions, onTapClosure: onTapClosure)
    }
    
    public convenience init(with view: UIView, subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        self.init(subscriptions: &subscriptions, onTapClosure: onTapClosure)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(self)
    }
}
