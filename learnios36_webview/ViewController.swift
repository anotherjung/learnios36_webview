//
//  ViewController.swift
//  learnios36_webview
//
//  Created by Fomp on 9/17/15.
//  Copyright © 2015 Fomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func gobackButton(sender: UIButton) {
        print("yo goback pressed")
        webView.goBack()
    }
    
    
    @IBAction func goButton(sender: UIButton) {
        print("yo gobutton pressed")
        if addressBar.text == "" {
            return 
        }
        
        guard let text: String = addressBar.text else {
            return
        }
        loadURL(text)
        
    }
    
    
    
    //takes a string and load url
    func loadURL(str:String) {
        print("yo loadURL")
        let url = NSURL(string: str)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
        
    }
    
    
    @IBAction func goforwardButton(sender: UIButton) {
        print("yo goforward pressed")
        webView.goForward()
    }
    
    


}

