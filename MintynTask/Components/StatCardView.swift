//
//  StatCardView.swift
//  MintynTask
//
//  Created by waheedCodes on 27/05/2025.
//

import UIKit

class StatCard: UIView {
    init(title: String, value: String, color: UIColor) {
        super.init(frame: .zero)
        backgroundColor = color
        layer.cornerRadius = 30
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = .black
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .boldSystemFont(ofSize: 20)
        valueLabel.textColor = .black
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
