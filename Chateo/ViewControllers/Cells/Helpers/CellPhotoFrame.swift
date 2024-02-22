//
//  CellPhotoFrame.swift
//  Chateo
//
//  Created by Daniil Rassadin on 21/2/24.
//

import UIKit

final class CellPhotoFrame: UIView {

    // MARK: Lifecycle
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientForPhotoFrame()
    }
    
    // MARK: SetupUI
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = 18
        isHidden = true
    }
    
    private func setGradientForPhotoFrame() {
        let shape = CAShapeLayer()
        shape.lineWidth = 5
        shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: 18).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.colors = [UIColor.firstGradientFirst.cgColor, UIColor.firstGradientSecond.cgColor]
        gradient.mask = shape
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        layer.addSublayer(gradient)
    }
    
}
