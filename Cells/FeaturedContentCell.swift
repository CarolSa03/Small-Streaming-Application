//
//  FeaturedContentCell.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class FeaturedContentCell: UICollectionViewCell {
    static let reuseIdentifier = "FeaturedContentCell"
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = Colours.primary
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = Colours.textPrimary
        label.numberOfLines = 2
        return label
    }()
    
    private let gradiantLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradient.locations = [0.6, 1.0]
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradiantLayer.frame = imageView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.layer.addSublayer(gradiantLayer)
        contentView.addSubview(titleLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor), imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor), titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16), titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16), titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
            ])
        contentView.bringSubviewToFront(titleLabel)
    }
    
    func configure(with viewModel: ContentCellViewModel ){
        titleLabel.text = viewModel.title
        if let image = UIImage(named: viewModel.imageURL) {
                imageView.image = image
            } else {
                print("FeaturedContentCell: Failed to load image named \(viewModel.imageURL)")
                imageView.image = nil
                imageView.backgroundColor = Colours.primary
            }
        imageView.backgroundColor = Colours.primary
        let colours = [Colours.primary, Colours.accent, UIColor.systemPurple, UIColor.systemTeal]
        imageView.backgroundColor = colours[abs(viewModel.title.hashValue) % colours.count]
    }
}
