//
//  Module: UISubscribableDemo
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import Combine
import UIKit

class DemoInteractionsViewController: UIViewController {

    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        _ = tapGesture
    }
    
    lazy var tapGesture: UITapGestureRecognizer = {
        UITapGestureRecognizer(with: view, subscriptions: &subscriptions) { [weak self] _ in
            guard let self = self else { return }
            self.show(DemoInteractionsViewController(), sender: self)
        }
    }()
}

extension DemoInteractionsViewController: DemoInteractionsControllerConfigurable { }
