# ios-line-login-demo
iOS LINEアカウントを利用したログインのサンプル（LineSDK_ios_4.0.2)

## 手順
### 1. [LINE BUSINESS Center](https://business.line.me/ja/)でアカウントを登録し、Channel IDを取得する

### 2. Pod　installする

```
pod 'LineSDK', '~> 4.0.2'      
```

### 3. Technical configurationで、Bundle IDとiOS Schemeを設定する
iOS Schemeは、「line3rdp.<バンドルID>」とする<br>
例) 	line3rdp.jp.st-ventures.ios-line-login-demo


### 4. LINE SDKをダウンロードする
[Download SDK](https://developers.line.me/ba/download/sdk/u3e6301863cbc63e50a752d9ed11f07ae)

### 5. フレームワークを追加する

・CoreTelephony.framework<br>
・Security.framework<br>
・LineSDK.framework<br>

### 6. Capabilitiesの「Keychain Sharing」をONにする

### 7. Info.plistを設定する
CHANNEL IDは、1で取得した値

```
<key>LineSDKConfig</key>
<dict>
    <key>ChannelID</key>
    <string>{CHANNEL ID}</string>
</dict>      
```

```
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>line3rdp.$(PRODUCT_BUNDLE_IDENTIFIER)</string>
        </array>
    </dict>
</array>
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>lineauth</string>
    <string>line3rdp.$(PRODUCT_BUNDLE_IDENTIFIER)</string>
</array>
```
### 8. AppDelegateにアプリからLINEを起動する処理を記載する

```swiftr:AppDelegate.swift
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return LineSDKLogin.sharedInstance().handleOpen(url)
    }
```

### 9. ログイン画面で、ログイン処理を実装する

```swift:ViewController.swift
    override func viewDidLoad() {
        super.viewDidLoad()
        LineSDKLogin.sharedInstance().delegate = self
    }

    @IBAction func didTapLogin(_ sender: UIButton) {
        LineSDKLogin.sharedInstance().start()
    }

```

```swift:ViewController.swift
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

        if let accessToken = credential?.accessToken {
            print("accessToken : \(accessToken)")
        }

        print("display Name : \(profile?.displayName ?? "unwap display name")")
        print("userID : \(profile?.userID ?? "unwap userID")")

        if let pictureURL = profile?.pictureURL {
            print("profile Picture URL : \(pictureURL)")
        }
    }
}
```

## マニュアル
[公式マニュアルはこちら](https://developers.line.me/ios/development-with-sdk-v2)
