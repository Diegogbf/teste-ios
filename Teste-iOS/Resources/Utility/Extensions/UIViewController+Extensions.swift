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

    func observeKeyboardBehavior() {
        dismissKeyboardWhenTapped()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillAppear),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillDisappear),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func keyboardWillAppear(notification: NSNotification) {
        let frame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let animation = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)
        guard let keyboardFrame = frame, let keyboardTimeAnimation = animation?.doubleValue  else { return }
        keyboardAppearanceChange(frame: keyboardFrame, animationDuration: keyboardTimeAnimation)
    }

    @objc private func keyboardWillDisappear(notification: NSNotification) {
        let animation = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)
        guard let keyboardTimeAnimation = animation?.doubleValue else { return }
        keyboardAppearanceChange(frame: .zero, animationDuration: keyboardTimeAnimation)
    }

    /// Need to be overridden
    @objc open func keyboardAppearanceChange(frame: CGRect, animationDuration: Double) {}

    func dismissKeyboardWhenTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardBanking))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboardBanking() {
        self.view.endEditing(true)
    }
}
