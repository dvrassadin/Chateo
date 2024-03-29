//
//  ContactTableViewCell.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit
import SnapKit

final class ContactTableViewCell: UITableViewCell {
    
    // MARK: Properties
    static var identifier: String = "ContactTableViewCell"
    
    // MARK: UI components
    private let photoImageView = CellPhotoImageView()
    private let photoFrame = CellPhotoFrame()
    private let textStackView = CellTextStackView()
    private let isOnlineIndicator = CellIsOnlineIndicator()
    
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
        contentView.addSubview(photoFrame)
        contentView.addSubview(photoImageView)
        contentView.addSubview(isOnlineIndicator)
        contentView.addSubview(textStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photoFrame.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(56)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.center.equalTo(photoFrame.snp.center)
            make.size.equalTo(48)
        }
        
        textStackView.snp.makeConstraints { make in
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.greaterThanOrEqualTo(56)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        isOnlineIndicator.snp.makeConstraints { make in
            make.size.equalTo(14)
            make.centerX.equalTo(photoImageView.snp.trailing).offset(-4)
            make.centerY.equalTo(photoImageView.snp.top).offset(4)
        }
    }
    
    func configure(user: User) {
        if let photo = user.photo {
            photoImageView.image = photo
        } else {
            photoImageView.setInitials(user.name)
        }
        textStackView.main = user.name.formatted()
        textStackView.secondary = user.lastSeen
        if user.isOnline { isOnlineIndicator.isHidden = false }
        if user.hasUnread { photoFrame.isHidden = false }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.prepareForReuse()
        textStackView.main = nil
        textStackView.secondary = nil
        isOnlineIndicator.isHidden = true
        photoFrame.isHidden = true
    }
}
