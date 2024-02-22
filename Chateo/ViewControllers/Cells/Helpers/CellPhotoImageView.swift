//
//  CellPhotoImageView.swift
//  Chateo
//
//  Created by Daniil Rassadin on 22/2/24.
//

import UIKit
import SnapKit

final class CellPhotoImageView: UIImageView {
    
    // MARK: UI components
    private let initialsLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 16
        label.backgroundColor = .initialsLabel
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Bold", size: 14)
        label.textColor = .white
        label.isHidden = true
        return label
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = 16
        contentMode = .scaleAspectFill
        addSubview(initialsLabel)
        initialsLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setInitials(_ name: PersonNameComponents) {
        initialsLabel.text = name.formatted(.name(style: .abbreviated))
        initialsLabel.isHidden = false
    }
    
    func prepareForReuse() {
        image = nil
        initialsLabel.isHidden = true
    }
}
