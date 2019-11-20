# firestore_demo

A Flutter app demoing the use of Firestore

## Firestore

### Configs
_Package name on firestore and app must be the same_

#### app/build.gradle
defaultConfig
- `multiDexEnabled true`
- `apply plugin: 'com.google.gms.google-services'`

#### gradle.properties
- `android.useAndroidX = true`
- `android.enableJetifier = true`

#### build.gradle
- `classpath 'com.android.tools.build:gradle:3.3.0'`
- `classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.0"`
- `classpath 'com.google.gms:google-services:4.3.3'`

#### pubspec.yaml
- `cloud_firestore: ^0.12.10+2`
