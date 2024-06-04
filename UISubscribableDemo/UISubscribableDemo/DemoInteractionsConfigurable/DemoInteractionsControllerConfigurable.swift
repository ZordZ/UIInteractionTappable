//
//  Module: UISubscribableDemo
//  Created by: MrTrent on 04.06.2024
//  Copyright (c) 2024 Zordz Union
//  


import UIKit

protocol DemoInteractionsControllerConfigurable: DemoInteractionsLabelConfigrable, DemoInteractionsNavBarConfigurable {
    func configure()
}

extension DemoInteractionsControllerConfigurable where Self: UIViewController {
    func configure() {
        view.backgroundColor = .white
        configureLabel()
        configureNavBarItems()
    }
}
