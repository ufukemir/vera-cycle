package com.ufukemir.cycle_app

import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity

// FLAG_SECURE blocks screenshots/screen recording and blanks the
// app-switcher thumbnail. Set unconditionally at launch, not tied to the
// in-app lock state: cycle data can appear on screen (a logged symptom, a
// prediction range) even seconds after the app unlocks, and this app's whole
// positioning is that such content never appears where it wasn't explicitly
// shown by the app itself — including a phone's own recent-apps switcher.
class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE,
        )
        super.onCreate(savedInstanceState)
    }
}
