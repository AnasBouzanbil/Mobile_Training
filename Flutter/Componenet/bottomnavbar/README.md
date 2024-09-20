# CurvedNavigationBar

#### Curved Navigation Bar Made Easy and Beautiful for Flutter

#### Create stunning curved navigation bars in your Flutter apps with minimal effort.


![bottom](https://miro.medium.com/v2/resize:fit:640/format:webp/1*voW7XoRwwOMwzAyVFG01HQ.png)









## Installation:

* type this command in your project folder :
```
flutter pub add curved_navigation_bar

````


## Usage:

* Import the package:

```Dart
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
```
* Create a CurvedNavigationBar in your Scaffold:

```Dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Track the currently selected index

  @override
  Widget build(BuildContext context) {
    return   
 Scaffold(
      // ... (your app's body)

      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepPurple, // Base color for the bar
        backgroundColor: Colors.deepPurple.shade300, // Background color
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation based on the selected index (explained later)
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.heart_broken),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
```

## Explanation:

* color: Defines the base color of the curved bar.
* backgroundColor: Sets the background color behind the curved bar.
* onTap: A callback function that gets triggered when an item is tapped. Inside the callback:
    * Update the _currentIndex state to reflect the selected item.
    * Navigation Logic: Add code to handle navigation based on the _currentIndex.
    * You can use a PageView or a navigation library like Navigator to switch between different screens depending on the selected item. (This is not included in the provided code snippet, but it's the crucial part for navigation functionality.)
* items: A list of widgets that define the navigation items. In this example, we're using Icon widgets, but you can customize them to use other widgets like text labels or custom icons.

