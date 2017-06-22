//
//  DetailViewController.swift
//  ios-line-login-demo
//
//  Created by Eiji Kushida on 2017/06/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    var profile: LineSDKProfile!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let displayName = profile?.displayName {
            print("display Name : \(displayName)")
        }

        if let displayName = profile?.userID {
            print("userID : \(displayName)")
        }

        if let pictureURL = profile?.pictureURL {
            print("profile Picture URL : \(pictureURL)")
        }
    }

    @IBAction func didTapLogout(_ sender: UIButton) {

        let apiClient = LineSDKAPI(configuration: LineSDKConfiguration.defaultConfig())

        apiClient.logout(queue: .main) { (success, error) in

            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
