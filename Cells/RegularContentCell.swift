//
//  RegularContentCell.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class RegularContentCell: UICollectionViewCell {
    static let reuseIdentifier = "RegularContentCell"
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = Colours.primary
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colours.textPrimary
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor), imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.5), titleLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8), titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4), titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
            ])
    }
    
    func configure(with viewModel: ContentCellViewModel) {
        titleLabel.text = viewModel.title
        if let image = UIImage(named: viewModel.imageURL) {
                imageView.image = image
            } else {
                print("RegularContentCell: Failed to load image named \(viewModel.imageURL)")
                imageView.image = nil
                imageView.backgroundColor = Colours.primary // fallback
            }
        let colours = [Colours.primary, Colours.accent, UIColor.systemPurple, UIColor.systemTeal, UIColor.systemPink]
        imageView.backgroundColor = colours[abs(viewModel.title.hashValue) % colours.count]
    }
}
