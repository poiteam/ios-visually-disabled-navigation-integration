# PoilabsVdNavigation iOS Integration

Sample iOS app that integrates **PoilabsVdNavigation** with Swift Package Manager.

## INSTALLATION

PoilabsVdNavigation is distributed with Swift Package Manager. CocoaPods is no longer supported.

### Swift Package Manager

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/poiteam/ios-vd-navigation-pod.git`
3. Choose **Exact Version** `7.2.2` and add the **PoilabsVdNavigation** product to your app target.

PoilabsPositioning, PoilabsSdkAnalytics and PoilabsCore are resolved automatically. SPM installation is supported from 7.2.1.

### Migrating from CocoaPods

Remove `pod 'PoilabsVdNavigation'` (and any `PoilabsCore`, `PoilabsPositioning` or `PoilabsSdkAnalytics` lines) from your `Podfile`, run `pod install` (or `pod deintegrate` if no other pods remain), then add the package as described above.

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
