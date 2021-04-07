//
//  CustomViewController.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import UIKit

class CustomViewController<View: UIView>: UIViewController {
    let contentView = View()

    override func loadView() {
        super.loadView()
        view = contentView
    }
}
