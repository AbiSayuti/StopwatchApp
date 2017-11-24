//
//  ViewController.swift
//  Stopwatch
//
//  Created by Abi Sayuti on 11/24/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = Timer()
    
    var isPlaying = false
    
    @IBOutlet weak var LTime: UILabel!
    @IBOutlet weak var LStart: UIButton!
    @IBOutlet weak var LPause: UIButton!
    @IBOutlet weak var LReplay: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        LTime.text = String(counter)
        LPause.isEnabled = false
        
    }

    @IBAction func BStart(_ sender: Any) {
        
        if(isPlaying){
            return
        }
        LStart.isEnabled = false
        LPause.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:
            #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        isPlaying = true
        
        
        
    }
    
    @objc func UpdateTimer(){
        
        counter = counter + 0.1
        LTime.text = String(format: "%.1f", counter)
    }
    
    
    @IBAction func BPause(_ sender: Any) {
        
        LStart.isEnabled = true
        LPause.isEnabled = false
        
        timer.invalidate()
        
        isPlaying = false
        
    }
    
    
    @IBAction func BReset(_ sender: Any) {
        
        LStart.isEnabled = true
        LPause.isEnabled = false
        
        timer.invalidate()
        
        isPlaying = false
        
        counter = 0.0
        
        LTime.text = String(counter)
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

