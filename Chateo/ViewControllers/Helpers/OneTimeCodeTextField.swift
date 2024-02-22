//
//  OneTimeCodeTextField.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit
import SnapKit

protocol OneTimeCodeTextFieldDelegate: AnyObject {
    func check(code: String)
}

final class OneTimeCodeTextField: UITextField {
    
    // MARK: Properties
    private var digitLabels = [UILabel]()
    private let labelsStackView = UIStackView()
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    weak var checkCodeDelegate: OneTimeCodeTextFieldDelegate?
    private let defaultSymbol: NSAttributedString = {
        let attachment = NSTextAttachment()
        attachment.image = UIImage.circle
        return NSAttributedString(attachment: attachment)
    }()
    
    // MARK: Lifecycle
    init(numberOfDigits: Int) {
        super.init(frame: CGRect())
        configureLabelsStackView(count: numberOfDigits)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configuration
    private func configureTextField() {
        delegate = self
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        addGestureRecognizer(tapGestureRecognizer)
        addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        addTarget(self, action: #selector(textChanging), for: .editingChanged)
    }
    
    private func configureLabelsStackView(count: Int) {
        labelsStackView.axis = .horizontal
        labelsStackView.distribution = .fillEqually
        labelsStackView.spacing = 10
    
        for _ in 0..<count {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .neutralActive
            label.font = UIFont(name: "MulishRoman-Bold", size: 32)
            label.attributedText = defaultSymbol
            label.isUserInteractionEnabled = true
            labelsStackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
    }
    
    @objc private func textChanging() {
        guard let text, text.count <= digitLabels.count else { return }
        
        digitLabels.enumerated().forEach { (index, label) in
            if index < text.count {
                let stringIndex = text.index(text.startIndex, offsetBy: index)
                label.text = String(text[stringIndex])
            } else {
                label.attributedText = defaultSymbol
            }
        }
        
        if text.count == digitLabels.count {
            checkCodeDelegate?.check(code: text)
        }
    }
}

// MARK: - UITextFieldDelegate
extension OneTimeCodeTextField: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let count = textField.text?.count else { return false }
        return count < digitLabels.count || string == ""
    }
}
