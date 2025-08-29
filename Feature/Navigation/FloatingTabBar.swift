//
//  FloatingTabBar.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class FloatingTabBar: UIView {
    weak var delegate: FloatingTabBarDelegate?
    
    private var tabButtons: [TabButton] = []
    private var selectedIndex: Int = 0
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colours.background
        view.layer.cornerRadius = 25
        view.layer.shadowColor = Colours.accent.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 8
        return view
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    struct TabItem {
        let title: String
        let icon: String
        let selectedIcon: String
        
        init(title: String, icon: String, selectedIcon: String) {
            self.title = title
            self.icon = icon
            self.selectedIcon = selectedIcon
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private func setupUI(){
        addSubview(backgroundView)
        backgroundView.addSubview(stackView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with items: [TabItem]) {
        tabButtons.forEach { $0.removeFromSuperview() }
        tabButtons.removeAll(keepingCapacity: true)
        
        for(index, item) in items.enumerated() {
            let button = TabButton(item: item, index: index)
            button.delegate = self
            button.isSelected = (index == selectedIndex)
            
            stackView.addArrangedSubview(button)
            tabButtons.append(button)
        }
    }
    
    func selectTab(at index: Int) {
        guard index < tabButtons.count else { return }
        
        tabButtons[selectedIndex].isSelected = false
        selectedIndex = index
        tabButtons[selectedIndex].isSelected = true
    }
}

extension FloatingTabBar : TabButtonDelegate {
    func tabButtonTapped(_ button: TabButton) {
        selectTab(at: button.index)
        delegate?.tabBar(self, didSelectTabAt: button.index)
    }
}
