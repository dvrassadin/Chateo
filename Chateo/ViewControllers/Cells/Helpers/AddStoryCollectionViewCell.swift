//
//  AddStoryCollectionViewCell.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit

final class AddStoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    static let identifier = "AddStoryCollectionViewCell"
    
    // MARK: UI components
    private let addStoryButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.neutralActive.cgColor
        button.layer.borderWidth = 3
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.tintColor = .neutralActive
        return button
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-Regular", size: 10)
        label.textColor = .neutralDisable
        label.text = String(localized: "Your Story")
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
        contentView.addSubview(addStoryButton)
        contentView.addSubview(textLabel)
        setupConstraints()
        addStoryButton.addTarget(
            self,
            action: #selector(addStory),
            for: .touchUpInside
        )
    }
    
    private func setupConstraints() {
        addStoryButton.snp.makeConstraints { make in
            make.size.equalTo(56)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.top.equalTo(addStoryButton.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(addStoryButton)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func addStory() {
        print("Add story button was tapped.")
    }
}
