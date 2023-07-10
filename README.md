# mobile-template

# figma link
https://www.figma.com/file/vHMp02ZVlqtXw0qTDPEsH4/Mobile-Banking-App-template?type=design&node-id=0-1&mode=design&t=KT2gDnN4AsN92CKQ-0
 

# Deployment

## Manual

```
flutter clean
flutter pub get
```

### Build for internal testing on Firebase

```
flutter build apk --flavor staging -t lib/main_staging.dart
flutter build apk --flavor development -t lib/main_development.dart
flutter build apk --flavor production -t lib/main_production.dart
```

### Run release

- Dev

flutter run --release --flavor=development --target=lib/main_development.dart

- Main

flutter run --release --flavor=development --target=lib/main_production.dart

