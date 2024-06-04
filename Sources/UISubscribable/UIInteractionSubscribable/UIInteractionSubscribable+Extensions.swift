//
//  Module: UIInteractionTappable
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//


import Combine
import UIKit

public extension UIInteractionSubscribable {
    func publisher(for event: UIControl.Event) -> UIInteractionPublisher<Self> {
        UIInteractionPublisher(control: self, event: event)
    }
    
    func touchUpInsidePublisher() -> UIInteractionPublisher<Self> {
        publisher(for: .touchUpInside)
    }
    
    func valueChangedPublisher() -> UIInteractionPublisher<Self> {
        return publisher(for: .valueChanged)
    }
}

public extension UIInteractionSubscribable {
    typealias OnTapClosure = (UIInteractionSubscribable) -> Void
    func registerTap(subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        touchUpInsidePublisher()
            .sink(receiveValue: onTapClosure)
            .store(in: &subscriptions)
    }
}

// MARK: - UIRefreshControl

public extension UIRefreshControl {
    convenience init(subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        self.init()
        valueChangedPublisher()
            .sink(receiveValue: onTapClosure)
            .store(in: &subscriptions)
    }
}

// MARK: - UIBarButtonItem

public extension UIBarButtonItem {
    convenience init(title: String, style: UIBarButtonItem.Style, subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        self.init()
        self.title = title
        self.style = style
        registerTap(subscriptions: &subscriptions, onTapClosure: onTapClosure)
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItem.Style, subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        self.init()
        self.image = image
        self.style = style
        registerTap(subscriptions: &subscriptions, onTapClosure: onTapClosure)
    }
    
    convenience init(barButtonSystemItem: UIBarButtonItem.SystemItem, subscriptions: inout Set<AnyCancellable>, onTapClosure: @escaping OnTapClosure) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        registerTap(subscriptions: &subscriptions, onTapClosure: onTapClosure)
    }
}
