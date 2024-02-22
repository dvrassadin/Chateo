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
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    private let stories = User.users
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            StoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier
        )
        collectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView)
        setupConstraints()
        collectionView.reloadData()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(108)
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension StoriesFeedTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StoriesCollectionViewCell.identifier,
            for: indexPath
        ) as? StoriesCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(story: stories[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StoriesFeedTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 56, height: 76)
    }
}
