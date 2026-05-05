name: Build Flutter APK and Windows EXE

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: windows-latest
    env:
      FORCE_JAVASCRIPT_ACTIONS_TO_NODE24: true
    steps:
      - uses: actions/checkout@v4
      
      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: 'stable'
          channel: 'stable'

      - name: Install Dependencies
        run: flutter pub get

      - name: Build Windows EXE
        run: flutter build windows --release

      - name: Build Android APK
        run: flutter build apk --release

      - name: Upload Windows EXE
        uses: actions/upload-artifact@v4
        with:
          name: windows-exe
          path: build/windows/runner/Release/

      - name: Upload Android APK
        uses: actions/upload-artifact@v4
        with:
          name: android-apk
          path: build/app/outputs/flutter-apk/app-release.apk
