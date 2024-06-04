//
//  Module: 
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import Combine
import UIKit

public struct UIGestureRecognizerPublisher: Publisher {
    
    public typealias Output = UIGestureRecognizerType
    public typealias Failure = Never
    
    private let gestureRecognizerType: UIGestureRecognizerType
    
    public init(gestureRecognizerType: UIGestureRecognizerType) {
        self.gestureRecognizerType = gestureRecognizerType
    }
    
    public func receive<S>(subscriber: S) where S : Subscriber, UIGestureRecognizerPublisher.Failure == S.Failure, UIGestureRecognizerPublisher.Output == S.Input {
        let subscription = UIGestureRecognizerSubscription(subscriber: subscriber, gestureRecognizerType: gestureRecognizerType)
        subscriber.receive(subscription: subscription)
    }
}
