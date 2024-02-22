//
//  CellTextStackView.swift
//  Chateo
//
//  Created by Daniil Rassadin on 21/2/24.
//

import UIKit

final class CellTextStackView: UIStackView {
    
    // MARK: Properties
    var main: String? {
        get { mainTextLabel.text }
        set { mainTextLabel.text = newValue }
    }
    
    var secondary: String? {
        get { secondaryTexLabel.text }
        set { secondaryTexLabel.text = newValue }
    }
    
    // MARK: UI components
    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        label.textColor = .neutralActive
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private let secondaryTexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MulishRoman-Regular", size: 12)
        label.textColor = .neutralDisable
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        axis = .vertical
        addArrangedSubview(mainTextLabel)
        addArrangedSubview(secondaryTexLabel)
    }
    
}
