//
//  FocusViewController.swift
//  Single_Mind
//
//  Created by Ricardo Wu on 2018/6/14.
//  Copyright © 2018年 Ricardo Wu. All rights reserved.
//
import UIKit
import AVFoundation
class FocusViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var timePickerView: UIPickerView!

    //播放音樂
    var playerCamp : AVAudioPlayer?
    var playerBeach : AVAudioPlayer?
    var playerRain : AVAudioPlayer?
    //case 參數
    let Campfire = "Campfire by the River"
    let Beach = "Tropical Beach"
    let Rain = "Tropical Rain"
    //Timer function, 先準備設置 variables 吧 (絕對有值)
    var timer = Timer()
    var timerIsOn = false
    var timeRemaining = 1500
    //Data
    let backgroundMusic = ["Campfire by the River", "Tropical Beach", "Tropical Rain"]
    var focusMode = "selected song"
    
    @IBAction func start(_ sender: Any) {
        if !timerIsOn{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(pomodoro), userInfo: nil, repeats: true)
            timerIsOn = true
        }
        
        //播放音樂
        print(focusMode)
        switch focusMode{
        case Campfire:
            playerCamp?.play()
            print(Campfire)
        case Beach:
            playerBeach?.play()
            print(Beach)
        case Rain:
            playerRain?.play()
            print(Rain)
        default:
            playerCamp?.play()
            print(Campfire)            
        }
    }
    //長按的function,用來停止計時器
    @objc func longPressHandler(){
        print("pressed.")
        //時間停止
        timer.invalidate()
        //這邊應該要加可以重置的東西
        timeLabel.text = "25:00"
        timerIsOn = false
        //音樂停止
        if (playerCamp?.isPlaying)!{
            playerCamp?.stop()
        }
        if (playerRain?.isPlaying)!{
            playerRain?.stop()
        }
        if (playerBeach?.isPlaying)!{
            playerBeach?.stop()
        }
        timeRemaining = 1500
    }
    //Stuck, come back later. (time format)
    @objc func pomodoro(){
        timeRemaining -= 1
        let minutesLeft = Int(timeRemaining) / 60 % 60
        let secondsLeft = Int(timeRemaining) % 60
        timeLabel.text = "\(minutesLeft):\(secondsLeft)"
        //時間到自動停止
        if timeRemaining <= 0{
            timer.invalidate()
            timeRemaining = 1500
        }
        
    }
    //總共有幾列pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBAction func stopTimer(_ sender: UILongPressGestureRecognizer) {
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return backgroundMusic.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return backgroundMusic[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            focusMode = backgroundMusic[row]
    }
    override func viewDidLoad() {
        timePickerView.delegate = self
        timePickerView.dataSource = self
        super.viewDidLoad()
        //長按以停止專注
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        self.view.addGestureRecognizer(longPress)
        longPress.minimumPressDuration = 0.4
        
        //第一首背景音樂-營火
        let filePath001 = Bundle.main.path(forResource: "Campfire by the River", ofType: "mp3")
        playerCamp = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath001!) )
        //第二首背景音樂-海灘
        let filePath002 = Bundle.main.path(forResource: "Tropical Beach", ofType: "mp3")
        playerBeach = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath002!) )
        //第三首背景音樂-雨林
        let filePath003 = Bundle.main.path(forResource: "Tropical Rain", ofType: "mp3")
        playerRain = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath003!) )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
