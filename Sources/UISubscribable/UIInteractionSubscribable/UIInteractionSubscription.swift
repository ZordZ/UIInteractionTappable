//
//  Module: UIInteractionTappable
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//


import Combine
import UIKit

final class UIInteractionSubscription<S: Subscriber, T: UIInteractionSubscribable>: Subscription where S.Input == T {
    private let subscriber: S?
    private weak var control: T?
    private let event: UIControl.Event
    
    public init(subscriber: S, control: T, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        self.event = event
        self.control?.attach(target: self, action: #selector(handleEvent(_:)), for: self.event)
    }
    
    @objc private func handleEvent(_ sender: Any) {
        guard let sender = sender as? T else { return }
        _ = self.subscriber?.receive(sender)
    }
    
    public func request(_ demand: Subscribers.Demand) { }
    
    public func cancel() {
        self.control?.detach(target: self, action: #selector(handleEvent(_:)), for: event)
        self.control = nil
    }
}
