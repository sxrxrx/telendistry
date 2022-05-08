# teledentistry_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.]

## Register

Base URL: 'https://mobile-teledentistry.herokuapp.com'

Request:
- Method: POST,
- Endpoint: 'auth/register/'

Body:

```json
{
    "email": "string",
    "password": "string"
    
}
```

Response:

```json
{
    "error" : "string",
    "message" : "String",
    "data" : {
        "email": "string",
        "role_id": "string"
    }
}
```

## Login

Base URL: 'https://mobile-teledentistry.herokuapp.com'

Request:
- Method: POST,
- Endpoint: 'auth/login/'

Body:

```json
{
    "email": "string",
    "password": "string"
}
```

Response:

```json
{
    "error": "string", 
    "message": "string",
    "data": {
        "access_token":"string",
        "refresh_token": "string"
    }
}
```

## Screens

Screens folder location: 'lib/screens'

- Handle: 
    - Dashboard
    - Login
    - Register
    - Welcome

Note: SplashScreen menggunakan library flutter_splash_native

## Dashboard Screen

location: 'lib/screens/dashboard'

- components: Class handle widget Home, Scanning, Schedule, Profile menggunakan bottomNavigation
- containers: Class-class helper untuk meng-handle UI yang berulang-ulang dipakai
- pages: Class untuk meng-handle page/halaman lain
    - Ex: user klik articel -> page WebViewPage terbuka
- widgets: Meng-handle item-item di BottomNavigation