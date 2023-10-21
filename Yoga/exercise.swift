//
//  Exercise.swift
//  Yoga
//
//  Created by hutao on 2023/9/16.
//

import UIKit
let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height
let id = "CustomCell"
class exercise: UIViewController {
    
    let imagesName = ["sitting posture and pranayama","mountain pose with extended arms","tree style","warrior one variant","warrior three variant","camel pose","inclined plate type"]
    
    override func viewDidLoad() {
        self.title = "Exercise"
        self.view.backgroundColor = .brown
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        self.view.addSubview(suggest)
    }
    
    
    lazy var suggest:UILabel = {
        let suggest = UILabel(frame: CGRect(x: 30, y: ScreenHeight * 0.1, width: ScreenWidth, height: 30))
        suggest.text = "Choose the yoga exercise you want to do"
        return suggest
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x:  ScreenWidth / 2 - 195, y: ScreenHeight / 2 - 220, width: 390, height: 440),collectionViewLayout: layout)
        collectionView.backgroundColor = .brown
//        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(exerciseCell.classForCoder(), forCellWithReuseIdentifier: id)
        return collectionView
    }()
    
}

extension exercise: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! exerciseCell
        let imageView = UIImageView(image: UIImage(named: imagesName[indexPath.row]))
        imageView.contentMode = .scaleAspectFill
        cell.backgroundView = imageView
        cell.infolabel.text = imagesName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc  = TrainController()
        vc.ImageView = UIImageView(image: UIImage(named: imagesName[indexPath.row]))
        vc.methodLabel.text = word[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension exercise: UICollectionViewDelegateFlowLayout{
    //每个单元格的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 420)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
