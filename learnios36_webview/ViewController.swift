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
            print("empty input")
            infoLabel.text =  "Please enter text =D"
            return
        }
        
        guard let text: String = addressBar.text else {
            return
        }
        //print(text)
        //2a removing previous feature //loadURL(text)
        //2b adding new feature, auto prepend http://
        if text.rangeOfString(".") != nil {
            infoLabel.hidden = true
            print("yo entered domain named")
            print(text)
            var finalString: String = text.lowercaseString
            if finalString.rangeOfString("http://") == nil {
                finalString = "http://\(finalString)"
                print("yo search term2")
            }
            self.loadURL(finalString)
        }
        //add new feature, search term
        else {
            print("yo entered search term1")
            print(text)
            infoLabel.hidden = true
            let searchStr = text.stringByReplacingOccurrencesOfString(" ", withString: "+")
            let finalStr = "https://www.google.com/search?q=\(searchStr)"
            self.loadURL(finalStr)
        }

        
    } //ends gobutton
    
    
    
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

