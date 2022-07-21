//
//  ViewController.swift
//  MiniBrowser
//
//  Created by MAC BOOK PRO 2013 EARLY on 2022/07/21.
//  Copyright © 2022 mario. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: UIWebView!
    
    @IBAction func bookMarkAction(_ sender: UISegmentedControl) { //북마크 이동
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex) //세그먼트 인덱스 제목을 가져온다
        var urlString = ""
        if bookMarkUrl == "mario's blog" {
            urlString = "https://blog.naver.com/smui04129"
        } else {
            urlString = "https://www.\(bookMarkUrl!).com"
        }
        //print(urlString)
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!)) //해당 url로 이동
        urlTextField.text = urlString //url주소를 보여준다
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //UITextFieldDelegate, url입력 이동
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlString)"
        }
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        textField.resignFirstResponder() //키보드 넣어주기
        return true
    }
    
    @IBOutlet var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    func webViewDidStartLoad(_ webView: UIWebView) { //UIWebViewDelegate
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    override func viewDidLoad() { //초기화면
        super.viewDidLoad()
        let urlString = "https://www.facebook.com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        // Do any additional setup after loading the view.
    }


}

