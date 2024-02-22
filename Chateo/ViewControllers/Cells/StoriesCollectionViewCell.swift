//
//  StoriesCollectionViewCell.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit
import SnapKit

final class StoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    static let identifier = "StoriesCollectionViewCell"
    
    // MARK: UI components
    private let photoFrame = CellPhotoFrame()
    private let photoImageView = CellPhotoImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-Regular", size: 10)
        label.textColor = .neutralDisable
        return label
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        contentView.addSubview(photoFrame)
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photoFrame.snp.makeConstraints { make in
            make.size.equalTo(56)
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        photoImageView.snp.makeConstraints { make in
            make.width.equalTo(48)
            make.height.equalTo(photoImageView.snp.width)
            make.center.equalTo(photoFrame.snp.center)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.top.equalTo(photoFrame.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(story: User) {
        if let photo = story.photo {
            photoImageView.image = photo
        } else {
            photoImageView.setInitials(story.name)
        }
        if story.hasUnread { photoFrame.isHidden = false }
        nameLabel.text = story.name.formatted()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoFrame.isHidden = true
        photoImageView.prepareForReuse()
        nameLabel.text = nil
    }
}
