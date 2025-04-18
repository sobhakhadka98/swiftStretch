
# 💪 SwiftStretch iOS App

An iOS fitness app built using **Storyboard**, **UIKit**, and **Core Data**. This app helps users explore exercises by targeting specific muscle groups and allows users to manage their favorite exercises for quick access.

## 📱 Features

- 🔍 Browse exercises by target muscle groups:
  - *abductors, abs, adductors, biceps, calves, cardiovascular system, delts, forearms, glutes, hamstrings, lats, levator scapulae, pectorals, quads, serratus anterior, spine, traps, triceps, upper back*
- 📡 Fetch real-time exercise data using the [ExerciseDB API](https://exercisedb.p.rapidapi.com/)
- 🏋️‍♀️ View detailed information for each exercise:
  - Exercise name
  - Animated GIF
  - Targeted body part
  - Equipment used
  - Secondary muscles
  - Step-by-step instructions
- ⭐ Add and remove exercises from your **Favorites**
- 🗂 Access all your favorited exercises in one place
- 🎯 Smooth navigation between target list, exercise list, and exercise detail views
- 🗃 Data persistence using **Core Data**
- 📐 Fully responsive layout using **Auto Layout**

## 🛠 Technologies Used

- **Language**: Swift
- **UI**: Storyboard + UIKit
- **API**: [ExerciseDB API](https://exercisedb.p.rapidapi.com/)
- **Data Persistence**: Core Data
- **Layout**: Auto Layout for dynamic screen adaptation

## 🔗 API Endpoint Used

- To fetch exercises by target:
  ```
  https://exercisedb.p.rapidapi.com/exercises/target/{target}
  ```

## 🧭 App Flow

1. **Target Selection Page**: A list of target muscle groups is displayed.
2. **Exercise List Page**: Displays a list of exercises fetched via API based on selected target.
3. **Exercise Detail Page**: Shows detailed information about the selected exercise along with a **favorite** toggle button.
4. **Favorites Page**: Access all saved exercises. Tapping any favorite opens the detail page again with updated state.

## 📦 Data Storage

- Core Data is used to persist the favorite exercises locally.
- Toggling the favorite button adds/removes exercises from Core Data.

## 🎨 UI/UX Notes

- Auto Layout ensures responsive design across different iOS devices.
- Storyboard is used for visual layout and navigation between screens.

## ✅ How to Use

1. Clone the repo and open it in Xcode.
2. Make sure to add your API Key in the networking layer (headers for `x-rapidapi-key` and `x-rapidapi-host`).
3. Run on a simulator or device.
4. Tap a target → Browse exercises → View details → Add to favorites → Explore favorites!
