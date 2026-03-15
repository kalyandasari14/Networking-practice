# Networking Practice 🌐

A collection of SwiftUI networking exercises demonstrating 
real-world iOS API integration patterns.

## Exercises

### Exercise 1 — Random Joke Generator 😂
Fetches a random joke from a live API with a button to load a new one.
```
GET https://official-joke-api.appspot.com/random_joke
```

### Exercise 2 — List of Users 👥
Fetches and displays a list of users with a detail view for each one.
```
GET https://jsonplaceholder.typicode.com/users
```

### Exercise 3 — Posts & Comments 📝
Fetches a list of posts and dynamically loads comments per post.
```
GET https://jsonplaceholder.typicode.com/posts
GET https://jsonplaceholder.typicode.com/posts/{id}/comments
```

## Features
- Loading and error states on every screen
- Empty state handling with ContentUnavailableView
- Retry button on network failure
- NavigationStack with detail views
- MVVM architecture throughout

## Tech Stack
- SwiftUI
- async/await networking
- URLSession
- JSONDecoder with Decodable structs
- MVVM architecture
- Observable macro
- NavigationStack + navigationDestination

## Architecture
```
Each exercise follows the same MVVM pattern:

ViewModel  → handles networking, loading, error states
View       → displays data, no networking logic
Model      → Decodable structs matching API response
```

## Requirements
- iOS 17+
- Xcode 15+

## How to Run
1. Clone the repo
2. Open the `.xcodeproj` file in Xcode
3. Select the exercise target
4. Hit Run — no API keys needed
