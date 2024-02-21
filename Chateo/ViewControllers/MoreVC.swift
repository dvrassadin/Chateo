//
//  MoreVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit

final class MoreVC: UIViewController {
    
    // MARK: Properties
    static let title = String(localized: "More")

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = Self.title
        tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
