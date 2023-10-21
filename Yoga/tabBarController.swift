//
//  tabBarControllerTableViewCell.swift
//  Yoga
//
//  Created by hutao on 2023/9/17.
//

import UIKit

class tabBarController:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: exercise())
        vc1.tabBarItem = UITabBarItem(title:"Exercise", image: UIImage(named: "sit"), tag:0)
        
        let vc2 = UINavigationController(rootViewController: AlarmController())
        vc2.tabBarItem = UITabBarItem(title: "Regular training", image: UIImage(named: "yoga1"), tag: 1)
        
        let vc3 = UINavigationController(rootViewController: hutaoInfoViewController())
        vc3.tabBarItem = UITabBarItem(title: "Info", image: UIImage(named: "info"), tag: 2)
        
//        vc1.title = "Ecercise"
//        vc2.title = "Regular training"
//        vc3.title = "Info"
        
        self.viewControllers = [vc1,vc2,vc3]
    }

}
