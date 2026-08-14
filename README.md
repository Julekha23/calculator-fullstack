# Calculator Fullstack

A full-stack calculator application built with **Flutter** for the frontend and **Go (Golang)** for the backend REST API.

## Features

- Basic arithmetic operations
  - Addition
  - Subtraction
  - Multiplication
  - Division
- Clean Flutter UI
- Go REST API backend
- JSON-based communication between frontend and backend
- Error handling for invalid operations (e.g., division by zero)

## Tech Stack

### Frontend
- Flutter
- Dart
- HTTP package

### Backend
- Go (Golang)
- REST API
- JSON
```

## API Endpoints

| Method | Endpoint | Description |
|---------|----------|-------------|
| POST | `/api` | Perform a calculation |

### Example Request

```json
{
  "num1": 20,
  "num2": 5,
  "operation": "div"
}
```

### Example Response

```json
{
  "result": 4
}
```

## Getting Started

### Backend

```bash
cd calculator-api
go mod tidy
go run main.go
```

The API will run on:

```
http://localhost:3000
```

### Frontend

```bash
cd calculator
flutter pub get
flutter run
```

## Screenshots

Add screenshots here.

## Future Improvements

- Scientific calculator
- Calculation history
- Dark mode
- Unit conversion
- Responsive UI
- Docker support
- Authentication (optional)

## Author

**Julekha Molla**

- GitHub: https://github.com/Julekha23
