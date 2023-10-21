//
//  CustomController.swift
//  Yoga
//
//  Created by hutao on 2023/9/19.
//

import UIKit

class AlarmController: UIViewController {
    
    class AlarmManager{
        var seconds: Int!
        var timer: Timer?
        init(seconds: Int!) {
            self.seconds = seconds
        }
        //返回一个时间格式的字符串
        var result: (Int) -> String = { seconds in
            let minutes = seconds / 60
            let sec = seconds % 60
            return String(format:"%02d:02d",minutes,sec)
        }
        //开始倒计时
        func startAlarm(completion: @escaping (String) -> Void){
            timer?.invalidate()
            //时间管理异步线程
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ [weak self] _ in
                
                guard let self = self else { return }
                
                self.seconds -= 1
                if self.seconds >= 0{
                    completion(self.result(self.seconds))
                }else{
                    
                }
            }
        }
        //停止倒计时
        func stopAlarm(){
            timer?.invalidate()
            timer = nil
        }
        
    }
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var TimeLabel: UILabel!
    
    var alarmManager
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    

}
