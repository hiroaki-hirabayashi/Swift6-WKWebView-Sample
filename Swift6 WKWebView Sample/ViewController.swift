//
//  ViewController.swift
//  Swift6 WKWebView Sample
//
//  Created by 平林宏淳 on 2020/10/13.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWebView()
        
    }
    
    func setUpWebView() {
        indicator.isHidden = true
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        let url = URL(string: "https://www.kurashiru.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func backButton(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goButton(_ sender: Any) {
        webView.goForward()
    }
    
//extension WKNavigationDelegate {
////    webView.navigationDelegate = self
//
//
//  }
}

