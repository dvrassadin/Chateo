//
//  WelcomeVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 19/2/24.
//

import UIKit
import SnapKit

final class WelcomeVC: UIViewController {
    // MARK: UI components
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.illustration)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Connect easily with your family and friends over countries")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "MulishRoman-Bold", size: 24)
        label.textColor = .neutralActive
        return label
    }()
    
    private let startButton = ContinueButton(title: String(localized: "Start Messaging"))
    
    private let termsLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Terms & Privacy Policy")
        label.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        label.textColor = .neutralActive
        label.isUserInteractionEnabled = true
        return label
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Navigation
    @objc private func showPhoneNumberVC() {
        navigationController?.pushViewController(PhoneNumberVC(), animated: true)
    }
    
    // MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeImageView)
        view.addSubview(welcomeTextLabel)
        view.addSubview(startButton)
        view.addSubview(termsLabel)
        startButton.addTarget(
            self,
            action: #selector(showPhoneNumberVC),
            for: .touchUpInside
        )
        setupConstraints()
    }
    
    private func setupConstraints() {
        welcomeImageView.snp.makeConstraints { make in
            make.height.equalTo(271)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
        }
        
        welcomeTextLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeImageView.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.741)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-25)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.875)
            make.height.equalTo(52)
        }
        
        termsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(startButton.snp.top).offset(-25)
        }
        
    }
}
