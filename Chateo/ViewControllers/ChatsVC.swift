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
//        view.addSubview(searchBar)
        view.addSubview(tableView)
//        tableView.tableHeaderView = searchBar
        setupConstraints()
    }
    
    private func setupConstraints() {
//        searchBar.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.height.greaterThanOrEqualTo(36)
//        }
//        
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(searchBar.snp.bottom).offset(12)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
        
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
