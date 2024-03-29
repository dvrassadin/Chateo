//
//  CustomSearchBar.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit

final class CustomSearchBar: UISearchBar {
    
    // MARK: Lifecycle
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        sizeToFit()
        searchBarStyle = .minimal
        placeholder = String(localized: "Search")
        searchTextField.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        searchTextField.backgroundColor = .neutralSecondaryBG
        setImage(UIImage.search, for: .search, state: .normal)
    }
}
