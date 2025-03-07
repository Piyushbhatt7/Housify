plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // Correct plugin usage
}

android {
    namespace = "com.example.housify"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin") // Corrected
        }
    }

    defaultConfig {
        applicationId = "com.example.housify"
        minSdk = 24  // Corrected
        targetSdk = flutter.targetSdkVersion  // Corrected
        versionCode = flutter.versionCode.toInt()  // Corrected
        versionName = flutter.versionName  // Corrected
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")  // Keep this only for testing
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Add necessary dependencies here
}
