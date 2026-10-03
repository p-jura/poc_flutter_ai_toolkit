# Flutter AI Toolkit POC

> **Status: projekt POC w trakcie developmentu.** Aplikacja służy do weryfikacji
> koncepcji i integracji; nie jest jeszcze ukończonym ani produkcyjnym produktem.

## Co robi aplikacja?

To prototyp aplikacji mobilnej z interfejsem czatu AI. Użytkownik może prowadzić
rozmowę z modelem Gemini, a widok czatu zapewnia pakiet Flutter AI Toolkit.
Połączenie z modelem jest realizowane przez Firebase AI.

## Technologie

- Flutter i Dart
- [Flutter AI Toolkit](https://pub.dev/packages/flutter_ai_toolkit) — interfejs czatu
- [Firebase AI](https://firebase.google.com/docs/ai-logic) — dostęp do modelu Gemini
- Firebase App Check — w konfiguracji Androida używany jest dostawca debugowania

## Uruchomienie

Wymagane są Flutter SDK oraz konfiguracja projektu Firebase dla obsługiwanej
platformy. Aplikacja korzysta z konfiguracji zapisanej w `lib/firebase_options.dart`.

1. Pobierz zależności:

	```sh
	flutter pub get
	```

2. Skonfiguruj Firebase dla projektu i upewnij się, że Firebase AI jest dostępne.
3. Uruchom aplikację na emulatorze lub urządzeniu:

	```sh
	flutter run
	```

## Zakres POC

Obecny zakres obejmuje podstawowy czat z modelem Gemini. Funkcjonalności,
konfiguracja i obsługiwane scenariusze mogą się zmieniać w miarę rozwoju
prototypu. Projekt nie powinien być traktowany jako gotowy do wdrożenia
produkcyjnego.
