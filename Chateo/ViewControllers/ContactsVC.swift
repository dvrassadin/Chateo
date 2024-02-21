//
//  ContactsVC.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit

final class ContactsVC: UITableViewController {
    
    // MARK: Properties
    static let title = String(localized: "Contacts")
    
    //MARK: UI components
    private let contacts = User.users
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search"
        searchBar.searchTextField.font = UIFont(name: "MulishRoman-SemiBold", size: 14)
        searchBar.backgroundColor = .neutralSecondaryBG
        searchBar.setImage(UIImage.search, for: .search, state: .normal)
        return searchBar
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.register(
            ContactTableViewCell.self,
            forCellReuseIdentifier: ContactTableViewCell.identifier
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = Self.title
        tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
        
    }

    // MARK: Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ContactTableViewCell.identifier,
            for: indexPath
        ) as? ContactTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(user: contacts[indexPath.row])

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: SetupUI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        tableView.tableHeaderView = searchBar
    }

}
