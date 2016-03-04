//
//  ViewController.swift
//  CarRacing
//
//  Created by Hai Hoang Ha on 2016-02-02.
//  Copyright © 2016 Hai Hoang Ha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var car1: UIImageView!
    
    @IBOutlet weak var car2: UIImageView!
    
    @IBOutlet weak var car3: UIImageView!
    
    @IBOutlet weak var car: UIImageView!
    
    @IBOutlet weak var lblScore: UILabel!
    
    var timer: NSTimer!
    
    @IBAction func playGame(sender: AnyObject) {
        
        car1.frame.origin.y = 0 - 600
        car2.frame.origin.y = 0 - 200
        car3.frame.origin.y = 0 - 300
        
        lblScore.text = "0"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self,selector: Selector("carRun"), userInfo: nil, repeats: true)
        
    }
    
    func carRun(){
        
        car1.frame = CGRectMake(car1.frame.origin.x, car1.frame.origin.y + 1, car1.frame.size.width, car1.frame.size.height)
        if car1.frame.origin.y == h{
            car1.frame.origin.y = 0 - 135
            let r:Float = Float(arc4random_uniform(UInt32(w)))
            car1.frame.origin.x = CGFloat(r)
        
            var diem:Int? = Int(lblScore.text!)
            diem = diem! + 1
            lblScore.text = String(diem!)
            
        }
        
        car2.frame = CGRectMake(car2.frame.origin.x, car2.frame.origin.y + 1, car2.frame.size.width, car2.frame.size.height)
        if car2.frame.origin.y == h{
            car2.frame.origin.y = 0 - 135
            let r:Float = Float(arc4random_uniform(UInt32(w)))
            car2.frame.origin.x = CGFloat(r)
            
            var diem:Int? = Int(lblScore.text!)
            diem = diem! + 1
            lblScore.text = String(diem!)
        }
        
        car3.frame = CGRectMake(car3.frame.origin.x, car3.frame.origin.y + 1, car3.frame.size.width, car3.frame.size.height)
        if car3.frame.origin.y == h{
            car3.frame.origin.y = 0 - 135
            let r:Float = Float(arc4random_uniform(UInt32(w)))
            car3.frame.origin.x = CGFloat(r)
            
            var diem:Int? = Int(lblScore.text!)
            diem = diem! + 1
            lblScore.text = String(diem!)
        }
        
        if CGRectIntersectsRect(car1.frame, car.frame) || CGRectIntersectsRect(car2.frame, car.frame) || CGRectIntersectsRect(car3.frame, car.frame) {
            timer.invalidate()
        }
        
        
    }
    
    var w:CGFloat!, h:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        w = self.view.frame.width
        h = self.view.frame.height
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "matduong")!)
        
        car1.frame = CGRectMake(car1.frame.origin.x, car1.frame.origin.y - 600, car1.frame.size.width, car1.frame.size.height)
        car2.frame = CGRectMake(car2.frame.origin.x, car2.frame.origin.y - 600, car2.frame.size.width, car2.frame.size.height)
        car3.frame = CGRectMake(car3.frame.origin.x, car3.frame.origin.y - 600, car3.frame.size.width, car3.frame.size.height)
        
        
    }

    @IBAction func dragCar(regconizer: UIPanGestureRecognizer) {
        let tran = regconizer.translationInView(self.view)
        regconizer.view!.center = CGPoint(x: regconizer.view!.center.x + tran.x, y: regconizer.view!.center.y)
        regconizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

