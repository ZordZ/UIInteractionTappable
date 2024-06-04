//
//  Module: 
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import Combine
import UIKit

final class UIGestureRecognizerSubscription<S: Subscriber>: Subscription where S.Input == UIGestureRecognizerType, S.Failure == Never {
    private var subscriber: S?
    private var gestureRecognizerType: UIGestureRecognizerType
    
    public init(subscriber: S, gestureRecognizerType: UIGestureRecognizerType) {
        self.subscriber = subscriber
        self.gestureRecognizerType = gestureRecognizerType
        configureGestureRecognizer(for: gestureRecognizerType)
    }
    
    private func configureGestureRecognizer(for gestureRecognizerType: UIGestureRecognizerType) {
        let gestureRecognizer = gestureRecognizerType.gestureRecognizer
        gestureRecognizer.addTarget(self, action: #selector(handleEvent))
    }
    
    @objc private func handleEvent() {
        _ = subscriber?.receive(gestureRecognizerType)
    }
    
    public func request(_ demand: Subscribers.Demand) { }
    
    public func cancel() {
        gestureRecognizerType.gestureRecognizer.removeTarget(self, action: #selector(handleEvent))
        subscriber = nil
    }
}
