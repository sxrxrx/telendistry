# teledentistry_app

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
