//
//  TabBarController.swift
//  Chateo
//
//  Created by Daniil Rassadin on 20/2/24.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: SetupUI
    private func setupUI() {
        setupTabBar()
        navigationItem.hidesBackButton = true
    }
    
    private func setupTabBar() {
        let contactsVS = ContactsVC()
        let contactsTabBarItem = UITabBarItem(
            title: ContactsVC.title,
            image: UIImage(named: "Contacts"),
            selectedImage: UIImage(named: "Contacts")
        )
        contactsVS.tabBarItem = contactsTabBarItem
        
        let chatsVC = ChatsVC()
        let chatsTabBarItem = UITabBarItem(
            title: ChatsVC.title,
            image: UIImage(named: "Chats"),
            selectedImage: UIImage(named: "Chats")
        )
        chatsVC.tabBarItem = chatsTabBarItem
        
        let moreVC = MoreVC()
        let moreTabBarItem = UITabBarItem(
            title: MoreVC.title,
            image: UIImage(named: "More"),
            selectedImage: UIImage(named: "More")
        )
        moreVC.tabBarItem = moreTabBarItem
        
        viewControllers = [contactsVS, chatsVC, moreVC]
    }

}
