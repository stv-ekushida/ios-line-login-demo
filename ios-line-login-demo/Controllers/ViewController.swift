//
//  ViewController.swift
//  ios-line-login-demo
//
//  Created by Eiji Kushida on 2017/06/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LineSDKLogin.sharedInstance().delegate = self
    }

    @IBAction func didTapLogin(_ sender: UIButton) {
        LineSDKLogin.sharedInstance().start()
    }
}

// MARK: - LineSDKLoginDelegate
extension ViewController: LineSDKLoginDelegate {

    func didLogin(_ login: LineSDKLogin,
                  credential: LineSDKCredential?,
                  profile: LineSDKProfile?,
                  error: Error?) {

        if error != nil {
            print(error.debugDescription)
            return
        }

        let vc = UIStoryboard.viewController(storyboardName: "Main",
                                             identifier: "DetailViewController") as! DetailViewController
        vc.profile = profile
        self.present(vc, animated: true, completion: nil)

//        if let accessToken = credential?.accessToken {
//            print("accessToken : \(accessToken)")
//        }
    }
}

