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
        tabBar.isTranslucent = false
        tabBar.tintColor = .neutralActive
    }
    
    private func setupTabBar() {
        let contactsVS = ContactsVC()
        let contactsTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "Contacts"),
            selectedImage: UIImage(named: "ContactsSelected")
        )
        contactsVS.tabBarItem = contactsTabBarItem
        
        let chatsVC = ChatsVC()
        let chatsTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "Chats"),
            selectedImage: UIImage(named: "ChatsSelected")
        )
        chatsVC.tabBarItem = chatsTabBarItem
        
        let moreVC = MoreVC()
        let moreTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "More"),
            selectedImage: UIImage(named: "MoreSelected")
        )
        moreVC.tabBarItem = moreTabBarItem
        
        viewControllers = [contactsVS, chatsVC, moreVC]
    }

}
