# 📱 Simple Flutter App

A minimal Flutter app for user login via an IAM backend service (interaction mobile app and backend)

---

## ⚙️ .env Setup

Create a `.env` file in the root:

```env
API_URL=http://10.0.2.2:8189
LOGIN_PATH=/auth/login
REGISTER_PATH=/auth/register
```

> Use `10.0.2.2` for local backend access via Android emulator.

---

## 🚀 Run the App

```bash
flutter pub get
flutter run
```