@echo off
REM ════════════════════════════════════════════════════════════════
REM تطبيق مدخلات الأختام الهيدروليكية - سكريبت البناء
REM Hydraulic Seal Logger - Build Script
REM ════════════════════════════════════════════════════════════════

cd /d "%~dp0"

echo.
echo ════════════════════════════════════════════════════════════════
echo    اختر الخيار (Choose an option):
echo ════════════════════════════════════════════════════════════════
echo.
echo    1) تحديث المكتبات (Update Dependencies)
echo    2) بناء موبايل APK (Build Android APK)
echo    3) بناء ويندوز (Build Windows Desktop)
echo    4) بناء ويب (Build Web)
echo    5) تشغيل التطبيق في الوضع العادي (Run in Debug mode)
echo    6) تشغيل تحليل الكود (Run Flutter Analyze)
echo    7) تنظيف المشروع (Clean Project)
echo.
echo ════════════════════════════════════════════════════════════════

set /p choice="اختر رقم الخيار (Enter choice number): "

if "%choice%"=="1" (
    echo.
    echo تحديث المكتبات...
    call flutter pub get
    echo تم بنجاح!
    pause
    goto :eof
)

if "%choice%"=="2" (
    echo.
    echo التحقق من Android SDK...
    call flutter config --android-sdk "C:\Android\Sdk" 2>nul
    echo بناء APK...
    call flutter build apk --release
    if errorlevel 0 (
        echo.
        echo ✓ تم البناء بنجاح!
        echo الملف: build\app\outputs\flutter-apk\app-release.apk
    ) else (
        echo ✗ حدث خطأ في البناء
    )
    pause
    goto :eof
)

if "%choice%"=="3" (
    echo.
    echo بناء ويندوز...
    call flutter build windows --release
    if errorlevel 0 (
        echo.
        echo ✓ تم البناء بنجاح!
        echo الملف: build\windows\runner\Release\hydraulic_seal_logger.exe
    ) else (
        echo ✗ حدث خطأ في البناء
        echo تأكد من تثبيت Visual Studio Community مع C++
    )
    pause
    goto :eof
)

if "%choice%"=="4" (
    echo.
    echo إضافة دعم الويب...
    call flutter create . --platforms web
    echo بناء الويب...
    call flutter build web --release
    if errorlevel 0 (
        echo.
        echo ✓ تم البناء بنجاح!
        echo المجلد: build\web\
    ) else (
        echo ✗ حدث خطأ في البناء
    )
    pause
    goto :eof
)

if "%choice%"=="5" (
    echo.
    echo الأجهزة المتاحة:
    call flutter devices
    echo.
    set /p device="اختر الجهاز (أو اضغط Enter للافتراضي): "
    if "%device%"=="" (
        call flutter run
    ) else (
        call flutter run -d %device%
    )
    pause
    goto :eof
)

if "%choice%"=="6" (
    echo.
    echo تحليل الكود...
    call flutter analyze
    pause
    goto :eof
)

if "%choice%"=="7" (
    echo.
    echo تنظيف المشروع...
    call flutter clean
    echo تحديث المكتبات...
    call flutter pub get
    echo ✓ تم التنظيف بنجاح!
    pause
    goto :eof
)

echo خيار غير صحيح!
pause
