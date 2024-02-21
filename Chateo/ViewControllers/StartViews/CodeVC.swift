//
//  CodeVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 19/2/24.
//

import UIKit

final class CodeVC: UIViewController {
    
    // MARK: UI components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Enter Code")
        label.textAlignment = .center
        label.font = UIFont(name: "MulishRoman-Bold", size: 24)
        label.textColor = .neutralActive
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = String(
            localized: "We have sent you an SMS with the code to +62 1309 - 1710 - 1920"
        )
        label.textAlignment = .center
        label.font = UIFont(name: "MulishRoman-Regular", size: 14)
        label.textColor = .neutralActive
        label.numberOfLines = 0
        return label
    }()
    
    private let otcTextField = OneTimeCodeTextField(numberOfDigits: 4)
    
    private let resendButton: UIButton = {
        let button = UIButton(configuration: .plain())
        var attributedTitle = AttributedString(localized: "Resend Code")
        attributedTitle.font = UIFont(name: "MulishRoman-SemiBold", size: 16)
        button.configuration?.attributedTitle = attributedTitle
        button.configurationUpdateHandler = { button in
            switch button.state {
            case .highlighted, .selected:
                button.configuration?.baseForegroundColor = .brandDark
            default:
                button.configuration?.baseForegroundColor = .brandDefault
            }
        }
        return button
    }()

    // MARK: Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        otcTextField.checkCodeDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(otcTextField)
        view.addSubview(resendButton)
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
        
        otcTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(248)
            make.height.equalTo(40)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(otcTextField.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }
}

extension CodeVC: OneTimeCodeTextFieldDelegate {
    func check(code: String) {
        if code.count == 4 {
            navigationController?.pushViewController(YourProfileVC(), animated: true)
        }
    }
}
