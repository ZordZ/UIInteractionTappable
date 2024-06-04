//
//  Module: UIInteractionTappable
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//


import Combine
import UIKit

public struct UIInteractionPublisher<T: UIInteractionSubscribable>: Publisher {
    public typealias Output = T
    public typealias Failure = Never
    
    private weak var control: T?
    private let event: UIControl.Event
    
    public init(control: T, event: UIControl.Event) {
        self.control = control
        self.event = event
    }
    
    public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, T == S.Input {
        guard let control = control else { return }
        let subscription = UIInteractionSubscription(subscriber: subscriber, control: control, event: event)
        subscriber.receive(subscription: subscription)
    }
}
