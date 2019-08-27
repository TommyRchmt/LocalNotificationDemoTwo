//
//  ViewController.swift
//  LocalNotificationDemoTwo
//
//  Created by Tommy Rachmat on 25/08/19.
//  Copyright © 2019 Tommy Rachmat. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    @IBOutlet weak var notifSwitchOutlet: UISwitch!
    @IBAction func notificationSwitch(_ sender: UISwitch) {
        if sender.isOn{
            
            scheduleLocal()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if notifSwitchOutlet.isOn == true{
            scheduleLocal()
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
    }
    
    @objc func registerLocal() {
        
        // Setting PERMISSION
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yey !")
            }
            else {
                print("D'oh !!")
            }
        }
    }
    
    func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        // Konten dari notifikasi
        
        let contentMorning = UNMutableNotificationContent()
        contentMorning.title = "Good Morning"
        contentMorning.body = "Take some time this morning to reflect"
        contentMorning.categoryIdentifier = "alarm"
        contentMorning.userInfo = ["customData": "fizzbuzz"]
        contentMorning.sound = .default
        
        let contentAfternoon = UNMutableNotificationContent()
        contentAfternoon.title = "Good Afternoon"
        contentAfternoon.body = "Take some time this afternoon to reflect"
        contentAfternoon.categoryIdentifier = "alarm"
        contentAfternoon.userInfo = ["customData": "fizzbuzz"]
        contentAfternoon.sound = .default
        
        let contentEvening = UNMutableNotificationContent()
        contentEvening.title = "Good Evening"
        contentEvening.body = "Take some time this evening to reflect"
        contentEvening.categoryIdentifier = "alarm"
        contentEvening.userInfo = ["customData": "fizzbuzz"]
        contentEvening.sound = .default
        
        
        // Waktu notifikasi
        
        var dateComponentsMorning = DateComponents()
        dateComponentsMorning.hour = 13
        dateComponentsMorning.minute = 4
        
        var dateComponentsAfternoon = DateComponents()
        dateComponentsAfternoon.hour = 13
        dateComponentsAfternoon.minute = 5
        
        var dateComponentsEvening = DateComponents()
        dateComponentsEvening.hour = 13
        dateComponentsEvening.minute = 6
        
        
        // Trigger notifikasi
        let triggerMorning = UNCalendarNotificationTrigger(dateMatching: dateComponentsMorning, repeats: true)
        let triggerAfternoon = UNCalendarNotificationTrigger(dateMatching: dateComponentsAfternoon, repeats: true)
        let triggerEvening = UNCalendarNotificationTrigger(dateMatching: dateComponentsEvening, repeats: true)
        
        // Melakukan request Notifikasi
        let requestMorningNotification = UNNotificationRequest(identifier: "MorningNotification", content: contentMorning, trigger: triggerMorning)
        center.add(requestMorningNotification)
        
        let requestAfternoonNotification = UNNotificationRequest(identifier: "AfternoonNotification", content: contentAfternoon, trigger: triggerAfternoon)
        center.add(requestAfternoonNotification)
        
        let requestEveningNotification = UNNotificationRequest(identifier: "EveningNotification", content: contentEvening, trigger: triggerEvening)
        center.add(requestEveningNotification)
    }
    
    


}

