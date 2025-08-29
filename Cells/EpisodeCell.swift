//
//  EpisodeCell.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class EpisodeCell: UICollectionViewCell {
    static let reuseIdentifier = "EpisodeCell"
    
    private let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = Colours.primary
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = Colours.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Colours.textPrimary
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Colours.textSecondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.backgroundColor = Colours.background
        contentView.layer.cornerRadius = 8
        
        contentView.addSubview(episodeImageView)
        contentView.addSubview(episodeNumberLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(durationLabel)
        
        NSLayoutConstraint.activate([
            episodeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            episodeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            episodeImageView.widthAnchor.constraint(equalToConstant: 120),
            episodeImageView.heightAnchor.constraint(equalToConstant: 64),
            
            episodeNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            episodeNumberLabel.leadingAnchor.constraint(equalTo: episodeImageView.trailingAnchor, constant: 12),
            episodeNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: episodeNumberLabel.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: episodeImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            durationLabel.leadingAnchor.constraint(equalTo: episodeImageView.trailingAnchor, constant: 12),
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure(with episode: Episode) {
        episodeNumberLabel.text = "Episode \(episode.number)"
        titleLabel.text = episode.title
        durationLabel.text = "\(episode.duration)"
        
        if let image = UIImage(named: episode.imageURL) {
            episodeImageView.image = image
        } else {
            episodeImageView.backgroundColor = Colours.primary
        }
    }
}
