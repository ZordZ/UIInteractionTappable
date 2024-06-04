//
//  Module: 
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import UIKit

public enum UIGestureRecognizerType {
    case unknown(UIGestureRecognizer = .init())
    case tap(UITapGestureRecognizer = .init())
    case swipe(UISwipeGestureRecognizer = .init())
    case longPress(UILongPressGestureRecognizer = .init())
    case edge(UIScreenEdgePanGestureRecognizer = .init())
    case pan(UIPanGestureRecognizer = .init())
    case pinch(UIPinchGestureRecognizer = .init())
    
    var gestureRecognizer: UIGestureRecognizer {
        switch self {
        case .unknown(let gesture):
            return gesture
        case .tap(let gesture):
            return gesture
        case .swipe(let gesture):
            return gesture
        case .longPress(let gesture):
            return gesture
        case .edge(let gesture):
            return gesture
        case .pan(let gesture):
            return gesture
        case .pinch(let gesture):
            return gesture
       }
    }
    
    var publisher: UIGestureRecognizerPublisher {
        UIGestureRecognizerPublisher(gestureRecognizerType: self)
    }
}
