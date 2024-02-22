//
//  CellIsOnlineIndicator.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit

final class CellIsOnlineIndicator: UIView {

    // MARK: Lifecycle
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        backgroundColor = .accentSuccess
        layer.cornerRadius = 6
        clipsToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.5
        isHidden = true
    }
}
