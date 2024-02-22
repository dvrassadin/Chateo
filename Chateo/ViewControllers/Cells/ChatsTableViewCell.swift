//
//  ChatsTableViewCell.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit

final class ChatsTableViewCell: UITableViewCell {

    // MARK: Properties
    static var identifier: String = "ChatsTableViewCell"
    
    // MARK: UI components
    private let photoImageView = CellPhotoImageView()
    private let isOnlineIndicator = CellIsOnlineIndicator()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let nameAndDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let messageAndCounterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        label.textColor = .neutralActive
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let unreadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-Regular", size: 10)
        label.textColor = .neutralDisable
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-Regular", size: 12)
        label.textColor = .neutralDisable
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let unreadCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-SemiBold", size: 10)
        label.textAlignment = .center
        label.backgroundColor = .brandBackground
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.isHidden = true
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
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
    func setupUI() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(isOnlineIndicator)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(nameAndDateStackView)
        mainStackView.addArrangedSubview(messageAndCounterStackView)
        nameAndDateStackView.addArrangedSubview(nameLabel)
        nameAndDateStackView.addArrangedSubview(unreadLabel)
        messageAndCounterStackView.addArrangedSubview(messageLabel)
        messageAndCounterStackView.addArrangedSubview(unreadCountLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(28)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.greaterThanOrEqualTo(56)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        isOnlineIndicator.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(isOnlineIndicator.snp.width)
            make.centerX.equalTo(photoImageView.snp.trailing).offset(-4)
            make.centerY.equalTo(photoImageView.snp.top).offset(4)
        }
        
        unreadCountLabel.snp.makeConstraints { make in
            make.width.equalTo(22)
            make.height.equalTo(20)
        }
    }
    
    func configure(chat: Chat) {
        if let photo = chat.fromUser.photo {
            photoImageView.image = photo
        } else {
            photoImageView.setInitials(chat.fromUser.name)
        }
        nameLabel.text = chat.fromUser.name.formatted()
        messageLabel.text = chat.text
        if chat.fromUser.isOnline { isOnlineIndicator.isHidden = false }
        unreadLabel.text = chat.time
        if chat.numberOfUnreadMessages > 0 {
            unreadCountLabel.text = String(chat.numberOfUnreadMessages)
            unreadCountLabel.isHidden = false
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.prepareForReuse()
        nameLabel.text = nil
        messageLabel.text = nil
        isOnlineIndicator.isHidden = true
        unreadLabel.text = nil
        unreadCountLabel.text = nil
    }
}
