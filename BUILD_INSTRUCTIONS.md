# تطبيق مدخلات الأختام الهيدروليكية - Hydraulic Seal Logger

## نظرة عامة
تطبيق فلاتر متكامل لتسجيل وإدارة أختام هيدروليكية مع واجهة مستخدم حديثة (Dark Theme) واستجابة كاملة للشاشات المختلفة.

## المميزات المضافة

### 1. بيانات جديدة
**العلامات التجارية (Brands):**
- Volvo, CAT, Hyundai, Komatsu, JCB, Doosan, Case, Liebherr, Hitachi, Bobcat

**أنواع الأطقم (Kit Types):**
- Bobcat Kit, Boom Kit, Arm Kit, Bucket Kit, Hydraulic Kit, Main Pump Kit

### 2. تصميم حديث (Premium Dark UI)
- خلفية داكنة: #121212
- ألوان أساسية: Golden Yellow (#FFD700)
- ألوان ثانوية: Ice Blue (#88DDEE)
- زوايا مستديرة: 15px على جميع الـ widgets

### 3. استجابة كاملة (Responsive Design)
- **للشاشات الكبيرة (> 800px):** عرض الأزرار جنباً إلى جنب
- **للهواتف الذكية (≤ 800px):** عرض الأزرار بشكل عمودي

### 4. قاعدة بيانات محسّنة
- CRUD operations محسّن مع `SharedPreferences`
- معالجة معرفات فريدة بشكل آمن
- تسلسل JSON محسّن

### 5. جداول المقارنة (Comparison Tables)
- بدون حدود
- ألوان صفوف بديلة (#1A1A1A و #242424)
- رؤوس بخط عريض وذهبي

---

## خطوات البناء

### المتطلبات المسبقة
```
1. Flutter SDK 3.41.9 أو أحدث
2. Dart SDK 3.11.5 أو أحدث
3. VS Code أو Android Studio
```

### للموبايل (Android APK)

#### الخطوة 1: تثبيت Android SDK
```powershell
flutter config --android-sdk "C:\path\to\android-sdk"
```

#### الخطوة 2: البناء
```powershell
cd C:\Users\{username}\Desktop\Hydraulic_Seal_Logger

# تحديث المكتبات
flutter pub get

# بناء APK Release
flutter build apk --release
```

**موقع الملف النهائي:**
```
build/app/outputs/flutter-apk/app-release.apk
```

---

### للكمبيوتر (Windows EXE)

#### الخطوة 1: التحقق من Visual Studio
تأكد من تثبيت Visual Studio Community مع:
- Desktop development with C++
- Windows SDK

#### الخطوة 2: البناء
```powershell
cd C:\Users\{username}\Desktop\Hydraulic_Seal_Logger

# تحديث المكتبات
flutter pub get

# بناء Windows Release
flutter build windows --release
```

**موقع الملف النهائي:**
```
build/windows/runner/Release/hydraulic_seal_logger.exe
```

---

### للويب

```powershell
cd C:\Users\{username}\Desktop\Hydraulic_Seal_Logger

# إضافة دعم الويب إذا لم يكن موجوداً
flutter create . --platforms web

# البناء
flutter build web --release
```

**موقع الملف النهائي:**
```
build/web/
```

---

## هيكل الملفات

```
Hydraulic_Seal_Logger/
├── lib/
│   ├── main.dart                 # تطبيق رئيسي (Android/iOS/Windows/Desktop)
│   ├── main_web.dart             # تطبيق الويب
│   ├── db/
│   │   └── database_helper.dart  # معالج قاعدة البيانات
│   └── models/
│       └── hydraulic_seal_set.dart # نموذج البيانات
├── android/                      # تكوين Android
├── windows/                      # تكوين Windows
├── pubspec.yaml                 # المكتبات والمتطلبات
├── analysis_options.yaml        # إعدادات التحليل
└── README.md                    # الوثائق الأساسية
```

---

## الملفات المهمة

### 1. main.dart
- الواجهة الرئيسية للتطبيق
- إدارة التنقل
- معالجة الحفظ والحذف والتحديث

### 2. database_helper.dart
```dart
// معاملات آمنة:
- insertSealSet()      // إضافة طقم جديد
- updateSealSet()      // تحديث طقم موجود
- deleteSealSet()      // حذف طقم
- fetchAllSealSets()   // جلب جميع الأطقم
- getSealSetById()     // البحث عن طقم بواسطة ID
```

### 3. hydraulic_seal_set.dart
```dart
class HydraulicSealSet {
  int? id;
  String machineName;
  String machineType;
  DateTime dateInput;
  // ... 12 حقل إضافي لبيانات الأختام
}
```

---

## التحديثات المطبقة

| الميزة | الحالة | التفاصيل |
|--------|---------|----------|
| تحديث البيانات | ✅ | 10 علامات + 6 أنواع أطقم |
| Dark Theme Premium | ✅ | #121212 خلفية + #FFD700 ذهبي |
| Responsive Design | ✅ | يدعم > 800px و ≤ 800px |
| CRUD محسّن | ✅ | معالجة آمنة للمعرفات |
| جداول مقارنة | ✅ | بدون حدود + ألوان بديلة |
| 15px Border Radius | ✅ | على جميع الـ widgets |

---

## تشغيل التطبيق في Mode التطوير

```powershell
cd C:\Users\{username}\Desktop\Hydraulic_Seal_Logger

# تشغيل على Windows Desktop
flutter run -d windows

# تشغيل على الويب
flutter run -d chrome

# تشغيل على Android (متصل الهاتف)
flutter run -d android
```

---

## حل المشاكل الشائعة

### "Unable to find suitable Visual Studio toolchain"
```powershell
flutter doctor -v
# ثم ثبّت Visual Studio Community مع C++ tools
```

### "No Android SDK found"
```powershell
flutter config --android-sdk "C:\Android\Sdk"
flutter doctor
```

### "Cannot find devices"
```powershell
flutter devices  # اعرض الأجهزة المتاحة
```

---

## الدعم والمساعدة

للحصول على مزيد المساعدة:
- [وثائق Flutter](https://flutter.dev/docs)
- [Flutter Community](https://flutter.dev/community)

---

## ملاحظات مهمة

1. **قاعدة البيانات:** البيانات تُخزن محلياً باستخدام `SharedPreferences`
2. **الاستيراد/التصدير:** يدعم JSON و Excel
3. **الاستجابة:** التصميم يتكيف تلقائياً مع حجم الشاشة
4. **الأداء:** محسّن للأجهزة المنخفضة الموارد

---

**تاريخ الإصدار:** 5 مايو 2026
**الإصدار:** 1.0.0 Release
