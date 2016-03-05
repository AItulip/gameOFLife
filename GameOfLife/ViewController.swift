//
//  ViewController.swift
//  GameOfLife
//
//  Created by apple on 15/12/21.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.mainScreen().bounds.width
let ScreenHright = UIScreen.mainScreen().bounds.height

class ViewController: UIViewController {

    @IBOutlet weak var lb: UILabel!
    let life = Life()
    
    var people = [[UIView]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        life.livedPeople()
        
        for i in 0..<102{
            var line = [UIView]()
            for j in 0..<102{
                let person = UIView()
                person.backgroundColor = life.world[i][j] == 0 ? UIColor.grayColor() : UIColor.whiteColor()
                person.frame = CGRectMake(CGFloat(i)*4 + 5, CGFloat(j)*4+5,4,4)
                view.addSubview(person)
                line.append(person)
            }
            people.append(line)
        }
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        update()
    }
    
    func update(){
        
        life.lifeStart()
        
        var count = 0
        
        for i in 0..<102{
            for j in 0..<102{
                
                if  life.world[i][j] == 0  {
                    people[i][j].backgroundColor = UIColor.grayColor()
                }else{
                    count++
                    people[i][j].backgroundColor = UIColor.whiteColor()
                }
            }
        }
        lb.text = "\(count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

