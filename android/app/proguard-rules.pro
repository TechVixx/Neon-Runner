# ProGuard rules for Neon Runner
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

-keepclassmembers class com.techvixx.neonrunner.MainActivity$* {
    *;
}

# Keep WebKit classes
-keep class androidx.webkit.** { *; }
