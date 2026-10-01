# PoilabsVdNavigation iOS Integration

Sample iOS app that integrates **PoilabsVdNavigation** with Swift Package Manager.

## INSTALLATION

### Swift Package Manager

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/poiteam/ios-vd-navigation-pod.git`
3. Choose **Exact Version** `7.2.2` and add the **PoilabsVdNavigation** product to your app target.

PoilabsPositioning, PoilabsSdkAnalytics and PoilabsCore are resolved automatically. SPM installation is supported from 7.2.1. Use either SPM or CocoaPods for this SDK, not both in the same app.

### CocoaPods

``` ruby
use_frameworks!
pod 'PoilabsVdNavigation'
```

PoilabsVdNavigation is no longer updated on CocoaPods trunk (the latest version there is 7.1.0). Swift Package Manager is the recommended installation method. To use a newer version with CocoaPods, install it and PoilabsCore from their git tags (PoilabsCore 1.0.17 is not on trunk):

``` ruby
pod 'PoilabsVdNavigation', :git => 'https://github.com/poiteam/ios-vd-navigation-pod.git', :tag => '7.2.2'
pod 'PoilabsCore', :git => 'https://github.com/poiteam/PoilabsCorePod.git', :tag => '1.0.17'
```

## PRE-REQUIREMENTS

Add the following keys to your `Info.plist`:

+Privacy - Location Usage Description

+Privacy - Location When In Use Usage Description

## USAGE

Replace `APPLICATION_ID`, `APPLICATION_SECRET_KEY` and `UNIQUE_ID` in `ViewController.swift` with the values provided by Poilabs.

``` Swift
import PoilabsVdNavigationUI

// Keep a reference while the SDK screen is open.
private var poilabsVdNavigation: PoilabsVdNavigationUI?

poilabsVdNavigation = PoilabsVdNavigationUI(withApplicationID: "APPLICATION_ID",
                                            withApplicationSecret: "APPLICATION_SECRET_KEY",
                                            withUniqueIdentifier: "UNIQUE_ID") { [weak self] controller in
    DispatchQueue.main.async {
        controller.modalPresentationStyle = .fullScreen
        self?.present(controller, animated: true)
    }
}
```
