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
  }
}
