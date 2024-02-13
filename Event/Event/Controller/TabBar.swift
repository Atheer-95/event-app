//
//  TabBar.swift
//  Event
//
//  Created by Atheer Othman on 03/08/1445 AH.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
          let navController              = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
        
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title        = title
        
          return navController
      }

    func setupVCs(){
        viewControllers = [
            createNavController(for: Composer.eventViewController(),
                                 title: NSLocalizedString("Events", comment: ""),
                                 image: UIImage(systemName: "scale.3d")!),
            createNavController(for: Composer.settingsViewController(),
                                   title: NSLocalizedString("Settings", comment: ""),
                                   image: UIImage(systemName: "gear")!)
        ]
    }
    

}
