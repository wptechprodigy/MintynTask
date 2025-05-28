//
//  InfoCardView.swift
//  MintynTask
//
//  Created by waheedCodes on 27/05/2025.
//

import UIKit

class InfoCard: UIView {
    init(icon: String, iconBgColor: UIColor, title: String, value: String, bgColor: UIColor) {
        super.init(frame: .zero)
        backgroundColor = bgColor
        layer.cornerRadius = 30
        
        let infoCardIcon = UIButton(type: .system)
        infoCardIcon.setImage(UIImage(systemName: icon), for: .normal)
        infoCardIcon.tintColor = .black
        infoCardIcon.backgroundColor = iconBgColor
        infoCardIcon.layer.cornerRadius = 25
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .systemGray
        titleLabel.font = .systemFont(ofSize: 12)
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .boldSystemFont(ofSize: 16)
        
        let stack = UIStackView(arrangedSubviews: [infoCardIcon, titleLabel, valueLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        addSubview(stack)
        infoCardIcon.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoCardIcon.heightAnchor.constraint(equalToConstant: 50),
            infoCardIcon.widthAnchor.constraint(equalToConstant: 50),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
