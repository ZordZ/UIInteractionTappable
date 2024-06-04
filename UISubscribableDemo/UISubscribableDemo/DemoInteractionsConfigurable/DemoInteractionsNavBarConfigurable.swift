//
//  Module: UISubscribableDemo
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import UIKit
import UISubscribable

protocol DemoInteractionsNavBarConfigurable: DemoInteractionsSubscribable {
    func configureNavBarItems()
}

extension DemoInteractionsNavBarConfigurable where Self: UIViewController {
    func configureNavBarItems() {
        navigationItem.setRightBarButton(somePlainButton, animated: false)
        navigationItem.setLeftBarButton(printButton, animated: false)
    }
}

private extension DemoInteractionsNavBarConfigurable {
    var somePlainButton: UIBarButtonItem {
        UIBarButtonItem(title: "somePlain", style: .plain, subscriptions: &subscriptions) { btn in
            (btn as? UIBarButtonItem)?.title = "tapped"
        }
    }
    
    var printButton: UIBarButtonItem {
        UIBarButtonItem(title: "print", style: .plain, subscriptions: &subscriptions) { [weak self] _ in
            guard let self = self else { return }
            self.printHello()
        }
    }
    
    func printHello() {
        print("Hello world")
    }
}
