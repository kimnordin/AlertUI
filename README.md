# AlertUI
AlertUI is a flexible library for displaying customizable alerts in SwiftUI applications.

## Installation
### Add AlertUI to your Xcode project.

```swift
dependencies: [
    .package(url: "https://github.com/kimnordin/AlertUI", from: "1.0.0")
]
```

## Usage
### Integrate AlertUI in your App.

#### Step 1: Setup Alert Manager  
Implement the AlertManager in your App to manage alerts:

```swift
import AlertUI // Import AlertUI

@main struct MyApp: App {
    @StateObject private var alertManager = AlertManager() // Add AlertManager
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(alertManager) // Provide AlertManager to the environment
        }
    }
}

```

#### Step 2: Implement AlertContainer  
Add the AlertContainer view where you want your alerts to appear:

```swift
struct MainView: View {
    @EnvironmentObject private var alertManager: AlertManager // Observe AlertManager changes
    
    var body: some View {
        VStack {
            AlertContainer() // Implement AlertContainer to display Alerts
        }
    }
}
```

#### Step 3: Customize Alerts
Customize alerts displayed in the AlertContainer:

```swift
AlertContainer { alert in
    alert
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
}
```

#### Step 4: Display Alerts
Trigger alerts through the AlertManager:

```swift
Button("Show Alert") {
    alertManager.display(Alert(title: "Hello", message: "I'm an Alert!"))
}
```
