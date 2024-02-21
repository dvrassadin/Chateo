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
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        label.textColor = .neutralActive
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-Regular", size: 12)
        label.textColor = .neutralDisable
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    private let isOnlineLabel: UIView = {
        let view = UIView()
        view.backgroundColor = .accentSuccess
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2.5
        view.isHidden = true
        return view
    }()
    
    private let photoFrame: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.isHidden = true
        return view
    }()
    
    private let initialsLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 16
        label.backgroundColor = .initialsLabel
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Bold", size: 14)
        label.textColor = .white
        label.isHidden = true
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientForPhotoFrame()
    }
    
    // MARK: Setup UI
    func setupUI() {
        contentView.addSubview(photoFrame)
        contentView.addSubview(photoImageView)
        contentView.addSubview(initialsLabel)
        contentView.addSubview(isOnlineLabel)
        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(textStackView)
        setupConstraints()
    }
    
    func setupConstraints() {
        photoFrame.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(56)
            make.height.equalTo(photoFrame.snp.width)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(photoFrame.snp.centerY)
            make.centerX.equalTo(photoFrame.snp.centerX)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }
        
        initialsLabel.snp.makeConstraints { $0.edges.equalTo(photoImageView) }
        
        textStackView.snp.makeConstraints { make in
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.greaterThanOrEqualTo(56)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        isOnlineLabel.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(isOnlineLabel.snp.width)
            make.centerX.equalTo(photoImageView.snp.trailing).offset(-4)
            make.centerY.equalTo(photoImageView.snp.top).offset(4)
        }
    }
    
    func configure(user: User) {
        if let photo = user.photo {
            photoImageView.image = photo
        } else {
            setInitials(name: user.name)
        }
        nameLabel.text = user.name.formatted()
        descriptionLabel.text = user.lastSeen
        if user.isOnline { isOnlineLabel.isHidden = false }
        if user.hasUnread { photoFrame.isHidden = false }
    }
    
    private func setInitials(name: PersonNameComponents) {
        initialsLabel.text = name.formatted(.name(style: .abbreviated))
        initialsLabel.isHidden = false
    }
    
    private func setGradientForPhotoFrame() {
        let shape = CAShapeLayer()
        shape.lineWidth = 5
        shape.path = UIBezierPath(roundedRect: photoFrame.bounds, cornerRadius: 18).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: photoFrame.frame.size)
        gradient.colors = [UIColor.firstGradientFirst.cgColor, UIColor.firstGradientSecond.cgColor]
        gradient.mask = shape
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        photoFrame.layer.addSublayer(gradient)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        isOnlineLabel.isHidden = true
        photoFrame.isHidden = true
        initialsLabel.isHidden = true
    }
}
