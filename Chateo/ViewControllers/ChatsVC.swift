//
//  ChatsVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit
import SnapKit

enum ItemType {
    case story, chat
}

final class ChatsVC: UIViewController {
    
    // MARK: Properties
    static let title = String(localized: "Chats")
    
    // MARK: UI components
    private let tableView = UITableView()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = Self.title
        tabBarController?.navigationItem.rightBarButtonItems = createBarButtonItems()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func createBarButtonItems() -> [UIBarButtonItem] {
        let newChatButtonItem = UIBarButtonItem(
            customView: UIImageView(image: UIImage(named: "NewChat"))
        )
        let readBarButtonItem = UIBarButtonItem(
            customView: UIImageView(image: UIImage(named: "ReadIcon"))
        )
        return [readBarButtonItem, newChatButtonItem]
    }
}

// MARK: - UITableViewDataSource
extension ChatsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
