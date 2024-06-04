//
//  Module: UISubscribableDemo
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import Combine

protocol DemoInteractionsSubscribable: AnyObject {
    var subscriptions: Set<AnyCancellable> { set get }
}
