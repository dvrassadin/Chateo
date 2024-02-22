//
//  ContactsVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit

final class ContactsVC: UIViewController {
    
    // MARK: Properties
    static let title = String(localized: "Contacts")
    private let contacts = User.users
    
    //MARK: UI components
    private let tableView = UITableView()
    private let searchBar = CustomSearchBar()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(
            ContactTableViewCell.self,
            forCellReuseIdentifier: ContactTableViewCell.identifier
        )
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = Self.title
        tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
        
    }
    
    // MARK: SetupUI
    private func setupUI() {
        view.backgroundColor = .systemBackground
//        view.addSubview(searchBar)
        view.addSubview(tableView)
        tableView.tableHeaderView = searchBar
        setupConstrains()
    }
    
    private func setupConstrains() {
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
}

// MARK: - UITableViewDataSource
extension ContactsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ContactTableViewCell.identifier,
            for: indexPath
        ) as? ContactTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(user: contacts[indexPath.row])
        
        return cell
    }
}
