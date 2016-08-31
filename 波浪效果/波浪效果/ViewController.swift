//
//  ViewController.swift
//  波浪效果
//
//  Created by 徐攀 on 16/8/30.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = UILabel()
        label.text = "我是大波浪～"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.layer.borderColor = UIColor.whiteColor().CGColor
        label.layer.borderWidth = 2.0
        label.layer.cornerRadius = 8
        label.frame = CGRect(x: (screenWidth() * 0.5 - 100), y: 0, width: 200, height: 50)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 200))
        let waveView = WaveView(frame: CGRect(x: 0, y: 180, width: UIScreen.mainScreen().bounds.size.width, height: 20))
        
        waveView.closure = {centerY in
            label.frame.origin.y = waveView.frame.origin.y + centerY - 70
        }
        
        view.backgroundColor = UIColor.redColor()
        view.addSubview(waveView)
        view.addSubview(label)
        tableView.tableHeaderView = view
        
        waveView.startWave()
    }
    
    func screenWidth() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

