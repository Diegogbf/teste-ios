//
//  UIView+Extensions.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 04/04/21.
//

import UIKit

extension UIView {
    func pinToSuperView(constant: CGFloat = 0.0) {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant),
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant)
        ])
    }
}
