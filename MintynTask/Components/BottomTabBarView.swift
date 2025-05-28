//
//  BottomTabBarView.swift
//  MintynTask
//
//  Created by waheedCodes on 27/05/2025.
//

import UIKit

class BottomTabBarView: UIView {
    private var buttons: [UIButton] = []
    private var selectedIndex: Int = 0

    init(tabs: [String], selectedIndex: Int = 0) {
        super.init(frame: .zero)
        self.selectedIndex = selectedIndex
        setupTabs(tabs)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTabs(_ tabs: [String]) {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        for (index, title) in tabs.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(index == selectedIndex ? .black : .gray, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
            button.backgroundColor = index == selectedIndex ? .white : .clear
            button.tag = index
            buttons.append(button)
            stack.addArrangedSubview(button)
        }

        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
