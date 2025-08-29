//
//  SearchViewController.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//

import UIKit

final class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate {
    private let viewModel: SearchViewModel
    private var collectionView: UICollectionView!
    private let searchBar = UISearchBar()

    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, ContentCellViewModel> = {
        UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegularContentCell.reuseIdentifier, for: indexPath) as! RegularContentCell
            cell.configure(with: item)
            return cell
        }
    }()

    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupSearchBar()
        setupCollectionView()
        bindViewModel()
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search movies and shows"
        searchBar.barStyle = .black
        searchBar.searchTextField.backgroundColor = .darkGray
        navigationItem.titleView = searchBar
    }

    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.createStreamingStyleSection(using: layoutEnvironment)
        }

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.register(RegularContentCell.self, forCellWithReuseIdentifier: RegularContentCell.reuseIdentifier)

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.keyboardDismissMode = .onDrag
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createStreamingStyleSection(using environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let containerWidth = environment.container.effectiveContentSize.width
        let minItemWidth: CGFloat = 140
        let spacing: CGFloat = 8

        let maxColumns = Int(containerWidth / (minItemWidth + spacing))
        let columns = max(maxColumns, 1)
        let totalSpacing = CGFloat(columns + 1) * spacing
        let availableWidth = containerWidth - totalSpacing
        let itemWidth = availableWidth / CGFloat(columns)
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(itemWidth),
            heightDimension: .absolute(240)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(280)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: Int(columns))
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: 0, bottom: spacing, trailing: 0)
        
        return section
    }


    private func bindViewModel() {
        viewModel.results.bind { [weak self] items in
            self?.applySnapshot(items)
        }
    }

    private func applySnapshot(_ items: [ContentCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, ContentCellViewModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task { await viewModel.search(query: searchText) }
    }
}
