//
//  UIViewController+Extensions.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 08/04/21.
//

import Foundation

import UIKit

extension UIViewController {
    func showErrorAlert(msg: String) {
        let alert = UIAlertController(title: .localize(for: "error.title"), message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: .localize(for: "button.title"), style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
