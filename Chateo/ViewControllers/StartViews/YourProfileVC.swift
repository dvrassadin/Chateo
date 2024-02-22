//
//  YourProfileVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit
import SnapKit

final class YourProfileVC: UIViewController {

    // MARK: UI components
    private let avatarImageView = UIImageView(image: UIImage(named: "Avatar"))
    private let saveButton = ContinueButton(title: String(localized: "Save"))
    
    private let changeAvatarButton: UIButton = {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.image = UIImage.plusIcon
        return button
    }()
    
    private lazy var firstNameTextField = createTextField(
        placeholder: String(localized: "First Name (Required)"),
        contentType: .givenName
    )
    
    private lazy var lastNameTextField = createTextField(
        placeholder: String(localized: "Last Name (Required)"),
        contentType: .familyName
    )
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Navigation
    @objc private func showTabBarController() {
        navigationController?.pushViewController(TabBarController(), animated: true)
    }

    // MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        title = String(localized: "Your Profile")
        view.addSubview(avatarImageView)
        avatarImageView.addSubview(changeAvatarButton)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(saveButton)
        setupConstraints()
        saveButton.addTarget(
            self,
            action: #selector(showTabBarController),
            for: .touchUpInside
        )
    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        
        changeAvatarButton.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(changeAvatarButton.snp.width)
            make.centerX.equalTo(avatarImageView.snp.trailing).multipliedBy(0.8536)
            make.centerY.equalTo(avatarImageView.snp.bottom).multipliedBy(0.8536)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.greaterThanOrEqualTo(36)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.greaterThanOrEqualTo(36)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-25)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.875)
            make.height.equalTo(52)
        }
    }
    
    private func createTextField(
        placeholder: String,
        contentType: UITextContentType
    ) -> UITextField {
        let textField = UITextField()
        let attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.neutralDisable,
                NSAttributedString.Key.font: UIFont(
                    name: "MulishRoman-SemiBold",
                    size: 14
                ) ?? .systemFont(ofSize: 14, weight: .semibold)
            ]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.textContentType = contentType
        textField.backgroundColor = .neutralSecondaryBG
        textField.borderStyle = .roundedRect
        return textField
    }
}
