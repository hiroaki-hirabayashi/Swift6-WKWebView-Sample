//
//  ViewController.swift
//  Swift6 WKWebView Sample
//
//  Created by 平林宏淳 on 2020/10/13.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var seachBar: UISearchBar!
    
    var webView = WKWebView()
    
    // ホームページのURL。起動時にこのページを開く
    let homeUrl = "https://www.google.com/?hl=ja"
    // 検索機能で使うURL
    let searchUrl = "https://www.google.co.jp/search?q="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        openUrl(urlString: homeUrl)

    }
    
    // 文字列で指定されたURLをWeb Viewを開く
    func openUrl(urlString: String) {
        indicator.isHidden = true
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        view.addSubview(webView)
        
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2

    }
    
    // 検索ボタンを押下した時に実行されるメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            let url = searchUrl + searchText.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            openUrl(urlString: url)
            searchBar.resignFirstResponder()
        }
    }

    
    func setUpWebView() {
        
//        let url = URL(string: "https://www.kurashiru.com/")
//        let request = URLRequest(url: url!)
//        webView.load(request)
//
    }
    
        // Web Viewが読み込みを終了した時に実行されるメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
        
    @IBAction func backButtonTapped(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        webView.goForward()
    }
   
    @IBAction func reloadButtonTapped(_ sender: Any) {
        webView.reload()
    }
}
