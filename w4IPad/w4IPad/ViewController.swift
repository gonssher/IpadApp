//
//  ViewController.swift
//  w4IPad
//
//  Created by Sherwin on 2020-01-27.
//  Copyright © 2020 Sherwin. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController ,UITextFieldDelegate, WKNavigationDelegate{

   
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    @IBOutlet var wbPage : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    @IBOutlet var lbName : UILabel!
    @IBOutlet var lbEmail : UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
        
        return textField.resignFirstResponder()
        
    }

    
   
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()

    }
    
    
    func webView(_ webView: WKWebView, didFinish didFinishNavigation: WKNavigation!) {
        activity.isHidden=true
        
        
        activity.stopAnimating()
    }
    
    @IBAction func saveData (sender : UIButton)
    {
        
        let alertbox = UIAlertController(title: "Warning", message: "Are you sure", preferredStyle: .alert)
        
        let noAction  = UIAlertAction(title: "No",style : .cancel, handler: nil)
        
        let yesAction = UIAlertAction(title: "Yes", style : .default)
        {
            (alert) in self.doTheUpdate()
            self.dismiss(animated: true, completion: nil)
        }
        alertbox.addAction(noAction)
        alertbox.addAction(yesAction)
        present(alertbox, animated: true)
        
    }
    
    func doTheUpdate()
    {
        
        let name = tfName.text
        let email = tfEmail.text
        let mydata = MyData()
        mydata.inWithData(theName: name!, theEmail: email!)
    
        lbName.text = mydata.name
        lbEmail.text = mydata.email
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
            let urlAddress = URL(string: "https://wwww.google.com")
            let url = URLRequest(url: urlAddress!)
            wbPage.load(url)
            wbPage.navigationDelegate = self
        activity.isHidden=true
    
    }

}

