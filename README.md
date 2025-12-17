# ⭐ Custom Rating Bar

A simple, customizable **Flutter rating bar** that supports  
⭐ Stars • ❤️ Hearts • 😀 Emojis  
with **Tap + Swipe**, **Half Rating**, and smooth animations.

---

## ✨ Features

- ⭐ Star / ❤️ Heart / 😀 Emoji rating
- 👆 Tap support
- 👉 Swipe (drag) support
- 🔢 Half rating (2.5, 3.5, etc.)
- 🎛 Enable / disable half rating
- 🎨 Custom colors
- 📏 Custom icon size & spacing
- 🎬 Smooth animation
- 📦 Library-ready & reusable

---

## 📦 Installation

### Add this to your `pubspec.yaml`:

```yaml
dependencies:
  custom_rating_bar:
    path: url:'../easy_rating_bar\custom_rating_bar'
```
### Using GitHub (recommended during development)
```yaml
dependencies:
  custom_rating_bar:
    git: url: https://github.com/YOUR_USERNAME/flip_card_view.git
```
### 📥 Import
```
import 'package:custom_rating_bar/custom_rating_bar.dart';
```
---
## 🚀 Basic Usage
```
CustomRatingBar(
  onRatingChanged: (rating) {
    print("Rating: $rating");
  },
)
```
---
## ⭐ Tap + Swipe Rating
```
CustomRatingBar(
  itemCount: 5,
  allowHalfRating: true,
  iconType: RatingIconType.star,
  onRatingChanged: (rating) {
    debugPrint("Rating: $rating");
  },
)
```
---
## ⚙️ Properties
| Property            | Type               | Default        | Description          |
| ------------------- | ------------------ | -------------- | -------------------- |
| `itemCount`         | `int`              | `5`            | Total rating items   |
| `initialRating`     | `double`           | `0`            | Initial rating value |
| `size`              | `double`           | `32`           | Icon size            |
| `spacing`           | `double`           | `2`            | Space between icons  |
| `iconType`          | `RatingIconType`   | `star`         | Star / Heart / Emoji |
| `allowHalfRating`   | `bool`             | `true`         | Enable half rating   |
| `activeColor`       | `Color`            | `Colors.amber` | Active icon color    |
| `inactiveColor`     | `Color`            | `Colors.grey`  | Inactive icon color  |
| `animationDuration` | `Duration`         | `300ms`        | Animation speed      |
| `onRatingChanged`   | `Function(double)` | required       | Rating callback      |

---
## 🧠 Rating Behavior
### ✔ Tap
- First tap → Half rating (if enabled)
- Second tap → Full rating
### ✔ Swipe
- Drag left/right to change rating smoothly
- Works with both half & full rating
---

## 📸 Demo
https://github.com/user-attachments/assets/16d1f068-b658-4267-b6b9-515a8fd2a595

---
## 🧩 Folder Structure
```
lib/
 ├── custom_rating_bar.dart
 └── src/
     └── custom_rating_bar.dart
```
---
## 📄 License
```
MIT License

Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

