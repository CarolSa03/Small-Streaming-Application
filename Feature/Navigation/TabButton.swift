//
//  TabButton.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class TabButton: UIView {
    
    weak var delegate: TabButtonDelegate?
    let index: Int
    private let item: FloatingTabBar.TabItem
    
    var isSelected: Bool = false {
        didSet {
            updateAppearance()
        }
    }
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    init(item: FloatingTabBar.TabItem, index: Int) {
        self.item = item
        self.index = index
        super.init(frame: .zero)
        setupUI()
        setupGesture()
    }
    
    required init?(coder: NSCoder){
        fatalError("error")
    }
    
    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),stackView.leadingAnchor.constraint(equalTo: leadingAnchor), stackView.trailingAnchor.constraint(equalTo: trailingAnchor), stackView.bottomAnchor.constraint(equalTo: bottomAnchor), iconImageView.widthAnchor.constraint(equalToConstant: 24), iconImageView.heightAnchor.constraint(equalToConstant: 24), widthAnchor.constraint(equalToConstant: 60)
            ])
            titleLabel.text = item.title
            updateAppearance()
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }

    @objc private func buttonTapped() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }
    delegate?.tabButtonTapped(self)
    }

    private func updateAppearance() {
        let iconName = isSelected ? item.selectedIcon : item.icon
        iconImageView.image = UIImage(systemName: iconName)

        let alpha: CGFloat = isSelected ? 1.0 : 0.6
        let color: UIColor = isSelected ? Colours.primary : .white

        UIView.animate(withDuration: 0.2) {
            self.iconImageView.tintColor = color
            self.titleLabel.textColor = color
            self.iconImageView.alpha = alpha
            self.titleLabel.alpha = alpha
        }
    }
}

