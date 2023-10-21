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
            return String(format:"%02d:%02d",minutes,sec)
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
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        self.title = "Regular training"
        picker.delegate = self
        picker.dataSource = self
        super.viewDidLoad()
    }
    
    private var seconds = 600
    private var timermanager: AlarmManager!
    private var isready = false
    
    @IBAction func startButton(_ sender: Any) {
        timermanager = AlarmManager(seconds: seconds)
        isready = true
        timermanager.startAlarm { [weak self] result in
            self?.TimeLabel.text = result
        }
        startButton.isEnabled = false
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timermanager.stopAlarm()
        startButton.isEnabled = true
    }
    
    @IBAction func resetButton(_ sender: Any) {
        TimeLabel.text = "10:00"
        stopButton(sender)
    }
}

extension AlarmController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if component == 0 {
               return 60 // 59分钟
           } else {
               return 60 // 60s
           }
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minutes = pickerView.selectedRow(inComponent: 0)
        let sec = pickerView.selectedRow(inComponent: 1)
        TimeLabel.text = String(format:"%02d:%02d",minutes,sec)
        seconds = minutes * 60 + sec
    }
    
}
