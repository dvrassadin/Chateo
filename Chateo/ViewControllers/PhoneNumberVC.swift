//
//  PhoneNumberVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 19/2/24.
//

import UIKit
import SnapKit

final class PhoneNumberVC: UIViewController {
    
    // MARK: UI components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Enter Your Phone Number")
        label.textAlignment = .center
        label.font = UIFont(name: "MulishRoman-Bold", size: 24)
        label.textColor = .neutralActive
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Please confirm your country code and enter your phone number")
        label.textAlignment = .center
        label.font = UIFont(name: "MulishRoman-Regular", size: 14)
        label.textColor = .neutralActive
        label.numberOfLines = 0
        return label
    }()
    
    private let phoneNumberStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let changeCountryButton: UIButton = {
        let button = UIButton(configuration: .filled())
        var attributedTitle = AttributedString("+62")
        attributedTitle.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        attributedTitle.foregroundColor = .red
        button.configuration?.attributedTitle = attributedTitle
        button.configuration?.background.backgroundColor = .neutralSecondaryBG
        button.configuration?.baseForegroundColor = .neutralDisable
        button.configuration?.image = UIImage(named: "Indonesia")
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return button
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        var attributedPlaceholder = NSAttributedString(
            string: String(localized: "Phone Number"),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.neutralDisable,
                NSAttributedString.Key.font: UIFont(
                    name: "MulishRoman-SemiBold",
                    size: 14
                ) ?? .systemFont(ofSize: 14, weight: .semibold)
            ]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.keyboardType = .phonePad
        textField.textContentType = .telephoneNumber
        textField.backgroundColor = .neutralSecondaryBG
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let continueButton = ContinueButton(title: String(localized: "Continue"))
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Navigation
    @objc private func showCodeVC() {
        navigationController?.pushViewController(CodeVC(), animated: true)
    }
    
    // MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(continueButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(phoneNumberStackView)
        phoneNumberStackView.addArrangedSubview(changeCountryButton)
        phoneNumberStackView.addArrangedSubview(phoneNumberTextField)
        continueButton.addTarget(self, action: #selector(showCodeVC), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(75)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.787)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.787)
        }
        
        phoneNumberStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(36)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-25)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.875)
            make.height.equalTo(52)
        }
    }
}
