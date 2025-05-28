//
//  TagButton.swift
//  MintynTask
//
//  Created by waheedCodes on 27/05/2025.
//

import UIKit

class TagButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        backgroundColor = .systemBlue
        layer.cornerRadius = 16
        contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
