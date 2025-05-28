//
//  ProfileViewController.swift
//  MintynTask
//
//  Created by waheedCodes on 27/05/2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI Elements
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let backButton = UIButton(type: .system)
    let profileLabel = UILabel()
    let gridButton = UIButton(type: .system)
    let profileImageView = UIImageView()
    let helpButton = UIButton(type: .system)
    
    let growingPlaceCard = InfoCard(icon: "sun.max", iconBgColor: .systemYellow, title: "Growing place", value: "Outdoor", bgColor: .white)
    let locationCard = InfoCard(icon: "location.slash.circle", iconBgColor: .systemTeal, title: "Location", value: "Sanremo, Italy", bgColor: .white)
    
    let yearsCard = StatCard(title: "Years", value: "12", color: .systemYellow)
    let helpsCard = StatCard(title: "Helps", value: "698", color: .systemOrange)
    let poundsCard = StatCard(title: "Pounds", value: "532", color: .systemGray4)
    
    let plantView = UIView()
    let plantLabel = UILabel()
    let cloniChip = Chip(title: "Cloni")
    let tecoloteChip = Chip(title: "Tecolote")
    let gearButton = UIButton(type: .system)
    let arrowButton = UIButton(type: .system)
    
    let tabStack = UIStackView()
    let tabs = ["Hello", "Stats", "Photos", "About"]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.2)
        
        applyGradientBackground()
        setupScrollView()
        setupTopBar()
        setupProfileSection()
        setupCards()
        setupStats()
        setupPlantSection()
        setupBottomTabs()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.sublayers?.first { $0 is CAGradientLayer }?.frame = view.bounds
    }
    
    // MARK: - Background
    private func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Customize your colors here
        gradientLayer.colors = [
            UIColor(hex: "#9B5A60").cgColor, // #9B5A60
            UIColor.black.cgColor
        ]
        
        // Set the direction: bottom-left to top-right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0) // bottom-left
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)   // top-right
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - Setup Methods
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupTopBar() {
        backButton.setImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        profileLabel.text = "Profile"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 16)
        profileLabel.textColor = .white
        gridButton.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        
        [backButton, profileLabel, gridButton].forEach {
            $0.tintColor = .white
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            gridButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            profileLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
            profileLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            gridButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func setupProfileSection() {
        profileImageView.image = UIImage(named: "rita-malcok")
        profileImageView.backgroundColor = .yellow
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
        helpButton.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        helpButton.tintColor = .white
        helpButton.backgroundColor = .systemGreen
        helpButton.layer.cornerRadius = 40
        
        [profileImageView, helpButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            helpButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            helpButton.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            helpButton.widthAnchor.constraint(equalToConstant: 80),
            helpButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupCards() {
        let cardStack = UIStackView(arrangedSubviews: [growingPlaceCard, locationCard])
        cardStack.axis = .horizontal
        cardStack.spacing = 8
        cardStack.distribution = .fillProportionally
        contentView.addSubview(cardStack)
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardStack.heightAnchor.constraint(equalToConstant: 150),
            cardStack.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            cardStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cardStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func setupStats() {
        let statStack = UIStackView(arrangedSubviews: [yearsCard, helpsCard, poundsCard])
        statStack.axis = .horizontal
        statStack.spacing = 4
        statStack.distribution = .fillEqually
        contentView.addSubview(statStack)
        statStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statStack.heightAnchor.constraint(equalToConstant: 80),
            statStack.topAnchor.constraint(equalTo: growingPlaceCard.bottomAnchor, constant: 8),
            statStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            statStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func setupPlantSection() {
        plantView.backgroundColor = UIColor(hex: "#C9DCB8")
        plantView.layer.cornerRadius = 30
        contentView.addSubview(plantView)
        plantView.translatesAutoresizingMaskIntoConstraints = false
        
        plantLabel.text = "50 plants"
        plantLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        [plantLabel, cloniChip, tecoloteChip, gearButton, arrowButton].forEach {
            plantView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        gearButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        gearButton.tintColor = .black
        gearButton.backgroundColor = .white
        gearButton.layer.cornerRadius = 25
        
        arrowButton.setImage(UIImage(systemName: "arrow.forward.circle"), for: .normal)
        arrowButton.tintColor = .black
        arrowButton.backgroundColor = UIColor(hex: "#DFEAD4")// #C9DCB8
        arrowButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            plantView.topAnchor.constraint(equalTo: poundsCard.bottomAnchor, constant: 8),
            plantView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            plantView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            plantView.heightAnchor.constraint(equalToConstant: 120),
            
            plantLabel.topAnchor.constraint(equalTo: plantView.topAnchor, constant: 30),
            plantLabel.leadingAnchor.constraint(equalTo: plantView.leadingAnchor, constant: 30),
            
            cloniChip.topAnchor.constraint(equalTo: plantLabel.bottomAnchor, constant: 4),
            cloniChip.leadingAnchor.constraint(equalTo: plantView.leadingAnchor, constant: 30),
            tecoloteChip.topAnchor.constraint(equalTo: plantLabel.bottomAnchor, constant: 4),
            tecoloteChip.leadingAnchor.constraint(equalTo: cloniChip.trailingAnchor, constant: 8),
            
            arrowButton.heightAnchor.constraint(equalToConstant: 50),
            arrowButton.widthAnchor.constraint(equalToConstant: 50),
            arrowButton.centerYAnchor.constraint(equalTo: plantView.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: plantView.trailingAnchor, constant: -30),
            gearButton.heightAnchor.constraint(equalToConstant: 50),
            gearButton.widthAnchor.constraint(equalToConstant: 50),
            gearButton.centerYAnchor.constraint(equalTo: plantView.centerYAnchor),
            gearButton.trailingAnchor.constraint(equalTo: arrowButton.leadingAnchor, constant: -8)
        ])
    }
    
    func setupBottomTabs() {
        tabStack.axis = .horizontal
        tabStack.spacing = 12
        tabStack.distribution = .fillEqually
        
        for (index, tab) in tabs.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(tab, for: .normal)
            button.setTitleColor(index == 1 ? .black : .white, for: .normal)
            button.backgroundColor = index == 1 ? .white : .black
            button.layer.cornerRadius = 24
            tabStack.addArrangedSubview(button)
        }
        
        contentView.addSubview(tabStack)
        tabStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabStack.topAnchor.constraint(equalTo: plantView.bottomAnchor, constant: 100),
            tabStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tabStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tabStack.heightAnchor.constraint(equalToConstant: 50),
            tabStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Reusable UI Components

class Chip: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = title
        backgroundColor = .white
        textColor = .black
        font = .systemFont(ofSize: 14)
        textAlignment = .center
        layer.cornerRadius = 12
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 24).isActive = true
        widthAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
