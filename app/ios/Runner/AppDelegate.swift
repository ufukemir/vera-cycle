import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  // iOS has no FLAG_SECURE equivalent — the app-switcher snapshot is taken
  // automatically as the app resigns active, so the only way to keep cycle
  // data out of it is to cover the window with a blank view first and remove
  // it once the app is genuinely frontmost again. This runs unconditionally,
  // same rationale as Android's FLAG_SECURE in MainActivity.kt.
  private let privacyOverlayTag = 987654321

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationWillResignActive(_ application: UIApplication) {
    showPrivacyOverlay()
    super.applicationWillResignActive(application)
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    hidePrivacyOverlay()
    super.applicationDidBecomeActive(application)
  }

  private func showPrivacyOverlay() {
    guard let window = self.window, window.viewWithTag(privacyOverlayTag) == nil else { return }
    let overlay = UIView(frame: window.bounds)
    overlay.tag = privacyOverlayTag
    overlay.backgroundColor = .systemBackground
    overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    window.addSubview(overlay)
  }

  private func hidePrivacyOverlay() {
    self.window?.viewWithTag(privacyOverlayTag)?.removeFromSuperview()
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    registerBackupExclusionChannel(with: engineBridge)
  }

  /// Marks a file with NSURLIsExcludedFromBackupKey.
  ///
  /// iOS backs up everything under Application Support by default, so without
  /// this the encrypted cycle diary would be copied into the user's iCloud
  /// backup — which is exactly the thing the app promises does not happen.
  /// There is no Info.plist equivalent; it has to be set per file, in code.
  private func registerBackupExclusionChannel(with engineBridge: FlutterImplicitEngineBridge) {
    let channel = FlutterMethodChannel(
      name: "vera/backup_exclusion",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )

    channel.setMethodCallHandler { call, result in
      guard call.method == "exclude",
            let args = call.arguments as? [String: Any],
            let path = args["path"] as? String
      else {
        result(FlutterMethodNotImplemented)
        return
      }

      var url = URL(fileURLWithPath: path)
      guard FileManager.default.fileExists(atPath: path) else {
        result(FlutterError(code: "missing", message: "No file at path", details: nil))
        return
      }

      do {
        var values = URLResourceValues()
        values.isExcludedFromBackup = true
        try url.setResourceValues(values)
        result(nil)
      } catch {
        result(FlutterError(code: "failed", message: error.localizedDescription, details: nil))
      }
    }
  }
}
