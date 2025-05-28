//
//  CircularImageView.swift
//  MintynTask
//
//  Created by waheedCodes on 27/05/2025.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {

    @IBInspectable var isCircular: Bool = true {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updateAppearance()
        }
    }

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            updateAppearance()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateAppearance()
    }

    private func updateAppearance() {
        if isCircular {
            self.layer.cornerRadius = min(self.frame.width, self.frame.height) / 2
            self.clipsToBounds = true
        }

        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
