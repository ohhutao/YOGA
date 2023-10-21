//
//  infoController.swift
//  Yoga
//
//  Created by hutao on 2023/9/17.
//

import UIKit

class infoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Info"
        scrollView.addSubview(label)
        scrollView.addSubview(image)
        self.view.addSubview(scrollView)
        //设置滚动的范围
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: label.frame.size.height + 40)
    }
    
    lazy var image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        image.image = UIImage(named: "yoga")
        return image
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollerView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        return scrollerView
    }()

    lazy var label:UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 200, width: ScreenWidth, height: ScreenHeight * 1.8))
        label.text = "The origin and development of yoga can be traced back to ancient India. Here are the key historical and evolutionary points in the origin and development of yoga:\n1. Ancient India's Origin: The origin of yoga dates back to ancient India, approximately between 5000 BCE and 2500 BCE. The earliest yoga practices can be traced to the ancient culture and philosophy of India, especially Hinduism and early Indian philosophical systems.\n2. Hinduism and Yoga: Yoga has deep connections with Hinduism. One of the earliest yoga texts is the Yajnavalkya Smriti, which is a text on morality, religion, and spiritual practices that includes some concepts of yoga. Hindu myths and traditional stories also contain elements of yoga practices.\n3. Systematization of Yoga: The systematization and categorization of yoga can be traced to the classic text known as the 'Yoga Sutras,' which was written by Patanjali around the 2nd century BCE. This text divided yoga into eight parts known as the 'Eight Limbs of Yoga,' including ethical guidelines, physical postures, breath control, sensory control, concentration, meditation, and transcendence. These principles form the basis of modern yoga practices.\n4. Development of Different Schools and Forms: Over time, yoga evolved into various schools and forms, including Hatha Yoga, Ashtanga Yoga, Iyengar Yoga, Kundalini Yoga, and more. Each school has its unique characteristics and emphases to cater to different individuals' needs and preferences.\n5. Spread of Yoga to the West: Yoga began to spread to the Western world in the 20th century, primarily through Indian yoga masters and Western yoga enthusiasts. Yoga gained widespread acceptance and development in the West, leading to various styles and traditions, such as Ashtanga Yoga, Bikram Yoga, Vinyasa Yoga, and others.\n6. Modern Applications of Yoga: Yoga has become a widely practiced method for physical and mental well-being. It is used to improve flexibility, enhance muscle strength, alleviate stress and anxiety, improve breathing, and promote inner peace and balance. Additionally, yoga is considered a spiritual and philosophical practice aimed at achieving inner tranquility and awakening.\nIn summary, the origin and development of yoga began in the backdrop of ancient Indian culture and philosophy. It has evolved over thousands of years to become a comprehensive discipline of physical and mental practices, profoundly impacting global health and well-being."
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
}
