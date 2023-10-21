//
//  TrainController.swift
//  Yoga
//
//  Created by hutao on 2023/9/17.
//

import UIKit
import Photos

struct GlobalConstants {
    
    static let ktopHeight: CGFloat = {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }
        
        let height = window.safeAreaInsets.top + (UIApplication.shared.delegate?.window??.rootViewController?.navigationController?.navigationBar.frame.height ?? 44.0)
        return height
    }()
    
    static let kbottomHeight: CGFloat = {
        guard let window = UIApplication.shared.windows.first else {
            return 0
        }
        let height = window.safeAreaInsets.bottom + (UIApplication.shared.delegate?.window??.rootViewController?.tabBarController?.tabBar.frame.height ?? 49.0)
        return height
    }()
    
}

class TrainController: UIViewController {
    
    var imgName = "0"
    
    lazy var ImageView: UIImageView = {
        let ImageView = UIImageView(frame: CGRect(x: 0, y: 60, width: ScreenWidth, height: 190))
        ImageView.contentMode = .scaleAspectFill
        return ImageView
    }()
    
    
    lazy var methodLabel: UILabel = {
        let method = UILabel(frame: CGRect(x: 0, y: 250, width: ScreenWidth, height: 200))
        method.numberOfLines = 0
        method.textAlignment = .left
        method.contentMode = .top
        return method
    }()
    
    lazy var storeLabel: UIButton = {
        let storelabel = UIButton(type: .custom)
        storelabel.frame = CGRect(x: ScreenWidth / 4, y: ScreenHeight / 1.2, width: ScreenWidth * 0.5, height: 40)
        storelabel.setTitle("Share the photo", for: .normal)
        storelabel.setTitleColor(UIColor.link, for: .normal)
        return storelabel
    }()
     
    
    @objc func shareFuncation(){
        let image = UIImage(named: imgName)
        let Items: [Any] = [image ?? ""]
        //创建的一个分享控制器
        let activityViewController = UIActivityViewController(activityItems: Items, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func showAlert(title:String,message: String){
        let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Success", style: .default))
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regular training"
        self.view.backgroundColor = .white
        self.view.addSubview(ImageView)
        self.view.addSubview(methodLabel)
        self.view.addSubview(storeLabel)
        storeLabel.addTarget(self, action: #selector(shareFuncation), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.ImageView.frame = CGRectMake(0,GlobalConstants.ktopHeight , ScreenWidth, 190)
        self.methodLabel.frame = CGRectMake(0, self.ImageView.frame.origin.y + self.ImageView.frame.size.height + 10, ScreenWidth, 200)
        self.methodLabel.sizeToFit()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
    
}
