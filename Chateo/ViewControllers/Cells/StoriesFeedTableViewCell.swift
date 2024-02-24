//
//  StoriesFeedTableViewCell.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit

final class StoriesFeedTableViewCell: UITableViewCell {

    // MARK: Properties
    static var identifier: String = "StoriesFeedTableViewCell"
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    private var stories = [User]()
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            StoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier
        )
        collectionView.register(
            AddStoryCollectionViewCell.self,
            forCellWithReuseIdentifier: AddStoryCollectionViewCell.identifier
        )
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        contentView.addSubview(collectionView)
        setupConstraints()
        collectionView.reloadData()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(108)
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func configure(stories: [User]) {
        self.stories = stories
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension StoriesFeedTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return stories.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AddStoryCollectionViewCell.identifier,
                for: indexPath
            ) as? AddStoryCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoriesCollectionViewCell.identifier,
                for: indexPath
            ) as? StoriesCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(story: stories[indexPath.item])
            return cell
        default: return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StoriesFeedTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0: return CGSize(width: 76, height: 76)
        case 1: return CGSize(width: 56, height: 76)
        default: return CGSize()
        }
    }
}
