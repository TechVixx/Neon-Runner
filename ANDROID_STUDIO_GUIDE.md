# Neon Runner — Android Studio APK Generation Guide

This project is fully configured and ready to generate an APK or Android App Bundle (AAB) directly in **Android Studio** with zero additional setup.

---

## 📱 App Specifications & Metadata

- **App Name:** `Neon Runner`
- **Package Name (Application ID):** `com.techvixx.neonrunner`
- **Developer:** `TechVixx Studios`
- **Version Name:** `1.0.0`
- **Version Code:** `1`
- **Minimum SDK:** `24` (Android 7.0 Nougat — supports 98%+ of active Android devices)
- **Target SDK:** `34` (Android 14 — fully compliant with Google Play Store 2024+ guidelines)
- **Compile SDK:** `34`
- **Orientation:** Portrait
- **Offline Capable:** 100% (No external CDNs, fonts, or network requests)
- **Display Mode:** Immersive Fullscreen (Edge-to-edge, display cutouts/notches handled)

---

## 🚀 Step-by-Step: How to Generate APK in Android Studio

### 1. Open in Android Studio
1. Launch **Android Studio**.
2. Click **Open** (or `File` → `Open...`).
3. Navigate to this project and select the **`android`** folder (e.g. `/path/to/project/android`).
4. Click **OK**.
5. Android Studio will automatically recognize the Gradle project, sync dependencies, and index the files.

---

### 2. Generate a Debug APK (Instant Testing)
1. In the top menu, go to:
   **`Build`** → **`Build Bundle(s) / APK(s)`** → **`Build APK(s)`**.
2. Wait for Gradle build to finish (typically 30–60 seconds on first build).
3. A notification will appear in the bottom-right corner:
   > *"APK(s) generated successfully for 1 module: Locate"*
4. Click **`Locate`** to open the folder containing the `.apk` file:
   ```
   android/app/build/outputs/apk/debug/app-debug.apk
   ```
5. You can now transfer `app-debug.apk` directly to your phone via USB, email, Google Drive, or run it in an Android emulator.

---

### 3. Generate a Release APK / Google Play AAB (Play Store Release)
1. In the top menu, go to:
   **`Build`** → **`Generate Signed Bundle / APK...`**
2. Choose either:
   - **Android App Bundle (AAB)** *(Recommended for Google Play Store upload)*
   - **APK** *(For direct distribution / sideloading)*
3. Select or create your keystore file (`.jks`).
4. Select `release` build variant and click **Finish**.
5. The signed APK/AAB will be placed in:
   ```
   android/app/build/outputs/apk/release/
   ```

---

### 4. Run Directly on Device or Emulator
1. Connect your Android phone with **USB Debugging** enabled (or start an Android Studio Virtual Device / Emulator).
2. Click the green **Run (▶)** button in the Android Studio toolbar.
3. The game will launch directly on your device in true edge-to-edge fullscreen mode at 60 FPS.

---

## 🔄 Syncing Game Updates

If you make modifications to the game code (HTML, CSS, or JavaScript):
1. In your terminal, run:
   ```bash
   npm run build
   ```
   *This automatically compiles and syncs the updated game into `android/app/src/main/assets/index.html`.*
2. In Android Studio, click **Make Project** (Ctrl+F9 / Cmd+F9) or rebuild your APK!

---

## 📂 Project Architecture

```
android/
├── build.gradle                              # Top-level Gradle configuration (AGP 8.4.2)
├── settings.gradle                           # Settings & repository resolution
├── gradle.properties                         # AndroidX & JVM optimization flags
├── gradlew / gradlew.bat                     # Official Gradle wrapper scripts
├── gradle/wrapper/
│   ├── gradle-wrapper.properties            # Configured with Gradle 8.7
│   └── gradle-wrapper.jar                   # Official binary wrapper
└── app/
    ├── build.gradle                          # Module config (SDK 34, package com.techvixx.neonrunner)
    ├── proguard-rules.pro                    # Production ProGuard rules
    └── src/main/
        ├── AndroidManifest.xml               # Fullscreen theme, portrait orientation, permissions
        ├── assets/
        │   └── index.html                    # Complete standalone offline game
        ├── java/com/techvixx/neonrunner/
        │   └── MainActivity.java             # Immersive WebView, WebViewAssetLoader, back button handling
        └── res/
            ├── values/                       # strings.xml, colors.xml, themes.xml
            ├── drawable/                     # Vector icons & drawables
            ├── mipmap-anydpi-v26/            # Adaptive icons (ic_launcher.xml, ic_launcher_round.xml)
            ├── mipmap-*/                     # Pre-rendered PNG launcher icons (mdpi to xxxhdpi)
            └── xml/                          # Backup and data extraction rules
```
