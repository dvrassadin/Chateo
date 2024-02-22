//
//  ChatsVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit
import SnapKit

final class ChatsVC: UIViewController {
    
    // MARK: Properties
    static let title = String(localized: "Chats")
    private let chats = Chat.example
    private let stories = User.users
    
    // MARK: UI components
    private let tableView = UITableView()
    private let searchBar = CustomSearchBar()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            ChatsTableViewCell.self,
            forCellReuseIdentifier: ChatsTableViewCell.identifier
        )
        tableView.register(
            StoriesFeedTableViewCell.self,
            forCellReuseIdentifier: StoriesFeedTableViewCell.identifier
        )
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = Self.title
        tabBarController?.navigationItem.rightBarButtonItems = createBarButtonItems()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createBarButtonItems() -> [UIBarButtonItem] {
        let newChatButtonItem = UIBarButtonItem(
            customView: UIImageView(image: UIImage.newChat)
        )
        let readBarButtonItem = UIBarButtonItem(
            customView: UIImageView(image: UIImage.readIcon)
        )
        return [readBarButtonItem, newChatButtonItem]
    }
}

// MARK: - UITableViewDataSource
extension ChatsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return chats.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoriesFeedTableViewCell.identifier,
                for: indexPath
            ) as? StoriesFeedTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatsTableViewCell.identifier,
                for: indexPath
            ) as? ChatsTableViewCell
            else { return UITableViewCell() }
            
            cell.configure(chat: chats[indexPath.row])
            
            return cell
        default: return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension ChatsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        section == 0 ? searchBar : nil
    }
}
