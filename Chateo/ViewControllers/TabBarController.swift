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
        tabBar.items?.forEach { item in
            item.imageInsets = .init(top: 12, left: 0, bottom: -12, right: 0)
        }
    }
    
    private func setupTabBar() {
        let contactsVS = ContactsVC()
        let contactsTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.contacts,
            selectedImage: UIImage.contactsSelected
        )
        contactsVS.tabBarItem = contactsTabBarItem
        
        let chatsVC = ChatsVC()
        let chatsTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.chats,
            selectedImage: UIImage.chatsSelected
        )
        chatsVC.tabBarItem = chatsTabBarItem
        
        let moreVC = MoreVC()
        let moreTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.more,
            selectedImage: UIImage.moreSelected
        )
        moreVC.tabBarItem = moreTabBarItem
        
        viewControllers = [contactsVS, chatsVC, moreVC]
    }

}
