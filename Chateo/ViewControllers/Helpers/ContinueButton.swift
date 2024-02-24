//
//  ContinueButton.swift
//  Chateo
//
//  Created by Daniil Rassadin on 19/2/24.
//

import UIKit

final class ContinueButton: UIButton {

    // MARK: Lifecycle
    init(title: String) {
        super.init(frame: CGRect())
        setup(title: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(title: "")
    }
    
    // MARK: Setup
    private func setup(title: String) {
        configuration = .filled()
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont(name: "MulishRoman-SemiBold", size: 16)
        configuration?.attributedTitle = attributedTitle
        configuration?.cornerStyle = .capsule
        configurationUpdateHandler = { button in
            switch button.state {
            case .highlighted, .selected:
                button.configuration?.background.backgroundColor = .brandDark
            default:
                button.configuration?.background.backgroundColor = .brandDefault
            }
        }
    }
}
