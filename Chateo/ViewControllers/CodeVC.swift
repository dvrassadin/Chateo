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
        label.text = String(localized: "We have sent you an SMS with the code to +62 1309 - 1710 - 1920")
        label.textAlignment = .center
        label.font = UIFont(name: "MulishRoman-Regular", size: 14)
        label.textColor = .neutralActive
        label.numberOfLines = 0
        return label
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
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
    }

}
