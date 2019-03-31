//
//  WebViewController.swift
//  基本视图
//
//  Created by VersonXu on 2019/01/24.
//  Copyright © 2019 VersonXu. All rights reserved.
//


//import 导入
import UIKit
import WebKit

//2.  WKWebView(网页视图)
//3.ActivityIndicatorView(指示控制器)

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
//    @IBOutlet weak var activityView: UIActivityIndicatorView!
    let newActivityView = UIActivityIndicatorView()
    
    let strUrl = "https://www.google.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newActivityView.style = .whiteLarge
        
        newActivityView.color = .blue
        let xNum = self.view.frame.width / 2
        let yNum = self.view.frame.height / 2
        newActivityView.center = CGPoint(x: xNum, y: yNum)
        newActivityView.hidesWhenStopped = true
        
        self.view.addSubview(newActivityView)
        
        
        
        webView.navigationDelegate = self
        
        if let url = URL(string: strUrl) {
            let request = URLRequest(url: url)
            webView.load(request)
        }



    }
    @IBAction func backToNew(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        newActivityView.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        newActivityView.stopAnimating()
    }
    
}
