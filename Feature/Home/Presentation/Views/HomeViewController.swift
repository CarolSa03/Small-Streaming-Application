//
//  HomeViewController.swift
//  miniapp
//
//  Created by Sá, Carolina (Technology Summer Intern) on 11/07/2025.
//
import UIKit

final class HomeViewController: UIViewController {
    weak var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel!
    
    private lazy var collectionView: UICollectionView = {
        let layout = HomeCompositionLayout.createLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Colours.background
        cv.delegate = self
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<ContentSection, ContentCellViewModel> = {
        createDataSource()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
        Task{
            await viewModel.loadContent()
        }
    }
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        registerCells()
    }
    
    private func bindViewModel() {
        viewModel.sections.bind { [weak self] sections in
            self?.updateSnapshot(with: sections)
        }
    }
    
    private func registerCells() {
        collectionView.register(FeaturedContentCell.self, forCellWithReuseIdentifier: FeaturedContentCell.reuseIdentifier)
        collectionView.register(RegularContentCell.self, forCellWithReuseIdentifier: RegularContentCell.reuseIdentifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
    }
    
    private func createDataSource() -> UICollectionViewDiffableDataSource<ContentSection, ContentCellViewModel> {
        UICollectionViewDiffableDataSource<ContentSection, ContentCellViewModel>(
            collectionView: collectionView
        ) { [weak self] collectionView, indexPath, item in
            self?.configureCell(collectionView: collectionView, indexPath: indexPath, item: item)
        }
    }
    
    private func configureCell(collectionView: UICollectionView, indexPath: IndexPath, item: ContentCellViewModel) -> UICollectionViewCell {
        let snapshot = dataSource.snapshot()
        let section = snapshot.sectionIdentifiers[indexPath.section]
        
        switch section.type{
        case .featured:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedContentCell.reuseIdentifier, for: indexPath) as! FeaturedContentCell
            cell.configure(with: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegularContentCell.reuseIdentifier, for: indexPath) as! RegularContentCell
            cell.configure(with: item)
            return cell
        }
    }
    
    private func updateSnapshot(with sections: [ContentSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<ContentSection, ContentCellViewModel>()
        
        for section in sections {
            snapshot.appendSections( [section] )
            let cellViewModels = section.items.map {
                ContentCellViewModel(contentType: $0)
            }
            snapshot.appendItems(cellViewModels, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            self?.configureSectionHeader(collectionView: collectionView, kind: kind, indexPath: indexPath)
        }
    }
    
    private func configureSectionHeader(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return nil
        }
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseIdentifier, for: indexPath) as! SectionHeaderView
        
        let snapshot = dataSource.snapshot()
        let section = snapshot.sectionIdentifiers[indexPath.section]
        headerView.configure(with: section.title)
        return headerView
    }

}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        //coordinator?.showContentDetail(contentType: item.ContentType)
        switch item.ContentType {
        case .movie(let movie):
            print("Select movie: \(movie.title)")
        case .show(let show):
            print("Select show: \(show.title)")
        }
    }
}
