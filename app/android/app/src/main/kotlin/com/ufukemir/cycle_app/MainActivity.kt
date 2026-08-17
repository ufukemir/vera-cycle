package com.ufukemir.cycle_app

import android.content.Intent
import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// FLAG_SECURE blocks screenshots/screen recording and blanks the
// app-switcher thumbnail. Set unconditionally at launch, not tied to the
// in-app lock state: cycle data can appear on screen (a logged symptom, a
// prediction range) even seconds after the app unlocks, and this app's whole
// positioning is that such content never appears where it wasn't explicitly
// shown by the app itself — including a phone's own recent-apps switcher.
class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "vera/launch_intent"

        /** Health Connect sends this when the user taps "see how this app
         *  uses your data". Landing them on the home screen would be a
         *  non-answer, so Dart reads this and opens the privacy screen. */
        const val ACTION_PRIVACY = "privacy_policy"
    }

    /** Consumed once: a rotation or a later resume shouldn't re-navigate. */
    private var pendingLaunchAction: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE,
        )
        pendingLaunchAction = launchActionFor(intent)
        super.onCreate(savedInstanceState)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        pendingLaunchAction = launchActionFor(intent) ?: pendingLaunchAction
    }

    private fun launchActionFor(intent: Intent?): String? =
        if (intent?.action == Intent.ACTION_VIEW_PERMISSION_USAGE) {
            ACTION_PRIVACY
        } else {
            null
        }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "takeLaunchAction") {
                    result.success(pendingLaunchAction)
                    pendingLaunchAction = null
                } else {
                    result.notImplemented()
                }
            }
    }
}
