# PoilabsVdNavigation iOS Integration

Sample iOS app that integrates **PoilabsVdNavigation** with Swift Package Manager.

## INSTALLATION

PoilabsVdNavigation is distributed with Swift Package Manager. CocoaPods is no longer supported.

### Swift Package Manager

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/poiteam/ios-vd-navigation-pod.git`
3. Choose **Exact Version** `7.3.0` and add the **PoilabsVdNavigation** product to your app target.

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

### Opening a specific venue (placeId)

From **7.3.0** you can open one venue directly instead of the venue list by passing its `placeId`. Ask PoiLabs for the `placeId` values of your venues. If you pass `nil`, an empty string or a `placeId` that is not one of your application's venues, the SDK opens the venue list as before.

``` Swift
poilabsVdNavigation = PoilabsVdNavigationUI(withApplicationID: "APPLICATION_ID",
                                            withApplicationSecret: "APPLICATION_SECRET_KEY",
                                            withUniqueIdentifier: "UNIQUE_ID",
                                            placeId: "PLACE_ID") { [weak self] controller in
    DispatchQueue.main.async {
        controller.modalPresentationStyle = .fullScreen
        self?.present(controller, animated: true)
    }
}
```

See the [SDK README](https://github.com/poiteam/ios-vd-navigation-pod#opening-a-specific-venue-placeid) for details.

### Closing the SDK screen

The SDK screen has no close button of its own. Pass an `additionalButton`: the SDK shows it on its first screen (the venue list, or the store list when you pass a `placeId`) and calls `poilabsVdNavigationDidTapOnAdditionalButton()` when it is tapped. Dismiss the SDK screen there.

``` Swift
poilabsVdNavigation = PoilabsVdNavigationUI(withApplicationID: "APPLICATION_ID",
                                            withApplicationSecret: "APPLICATION_SECRET_KEY",
                                            withUniqueIdentifier: "UNIQUE_ID",
                                            additionalButton: AdditionalButton(icon: UIImage(systemName: "xmark") ?? UIImage(),
                                                                               title: "Close")) { [weak self] controller in
    DispatchQueue.main.async {
        controller.modalPresentationStyle = .fullScreen
        self?.present(controller, animated: true)
    }
}
poilabsVdNavigation?.delegate = self

extension ViewController: PoilabsVdNavigationDelegate {
    func poilabsVdNavigationDidTapOnAdditionalButton() {
        presentedViewController?.dismiss(animated: true)
        poilabsVdNavigation = nil
    }
}
```

`UIImage(systemName:)` needs iOS 13; on iOS 12 use your own image.

**Using with PoilabsNavigation:** Do not keep both SDKs open at the same time: they use the same positioning and Bluetooth scanning. Close one SDK screen before you open the other.
