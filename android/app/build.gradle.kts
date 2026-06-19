android {
    namespace = "com.example.plus_only"
    compileSdk = flutter.compileSdkVersion
    
    // الحل هنا: استخدم إصدار NDK مستقر ومدعوم بالكامل من مكتبات الصوت والفيديو
    ndkVersion = "26.1.10909125"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    
    // ... اترك باقي الملف (defaultConfig و dependencies) كما عدلناه في الخطوة السابقة دون أي تغيير
}