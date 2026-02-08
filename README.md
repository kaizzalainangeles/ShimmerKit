# ShimmerKit

A lightweight, elegant shimmer effect for SwiftUI skeleton screens and loading states.

![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2015%2B%20%7C%20macOS%2012%2B-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Features

✨ **Easy to Use** - Just add `.shimmer()` to any view  
🎨 **Beautiful Animation** - Smooth, customizable shimmer effect  
🪶 **Lightweight** - Zero dependencies, pure SwiftUI  
📱 **Cross-Platform** - Works on iOS and macOS  
⚡ **Performant** - Optimized animations using `GeometryReader`

## Preview

![ShimmerKit Demo](https://via.placeholder.com/600x400?text=Add+your+demo+GIF+here)

## Installation

### Swift Package Manager

Add ShimmerKit to your project via Xcode:

1. File → Add Package Dependencies
2. Enter package URL: `https://github.com/yourusername/ShimmerKit`
3. Click Add Package

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/ShimmerKit", from: "1.0.0")
]
```

## Usage

### Basic Usage

Apply shimmer to any view with redacted placeholder:

```swift
import ShimmerKit

Text("Loading...")
    .redacted(reason: .placeholder)
    .shimmer()
```

### Conditional Shimmer

Show shimmer only while loading:

```swift
Text(viewModel.title)
    .redacted(reason: viewModel.isLoading ? .placeholder : [])
    .shimmer(isLoading: viewModel.isLoading)
```

### Skeleton Screen Example

Perfect for loading states in lists:

```swift
struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
    
    var body: some View {
        List {
            if viewModel.isLoading {
                ForEach(0..<3, id: \.self) { _ in
                    PostCardSkeleton()
                        .shimmer()
                }
            } else {
                ForEach(viewModel.posts) { post in
                    PostCard(post: post)
                }
            }
        }
    }
}

struct PostCardSkeleton: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                Text("Username Placeholder")
                    .font(.headline)
            }
            Text("This is placeholder content that will shimmer")
                .font(.body)
        }
        .redacted(reason: .placeholder)
    }
}
```

## API Reference

### View Extensions

#### `shimmer()`
Applies an animated shimmer effect to the view.

```swift
func shimmer() -> some View
```

#### `shimmer(isLoading:)`
Conditionally applies shimmer based on loading state.

```swift
func shimmer(isLoading: Bool) -> some View
```

### Modifiers

#### `ShimmerModifier`
The core modifier that creates the shimmer animation.

```swift
public struct ShimmerModifier: ViewModifier
```

#### `ShimmerIfLoading`
A conditional modifier that applies shimmer based on a boolean flag.

```swift
public struct ShimmerIfLoading: ViewModifier {
    let isLoading: Bool
}
```

## Demo App

Check out the full demo app in the `Examples/ShimmerKitDemo` folder to see ShimmerKit in action with a realistic feed UI.

To run the demo:

1. Clone this repository
2. Open `Examples/ShimmerKitDemo/ShimmerKitDemo.xcodeproj`
3. Build and run

## Requirements

- iOS 15.0+ / macOS 12.0+
- Swift 5.9+
- Xcode 15.0+

## Best Practices

1. **Always use with `.redacted(reason: .placeholder)`** for proper skeleton screens
2. **Keep shimmer on skeleton views** - don't apply to final content
3. **Use consistent loading patterns** throughout your app
4. **Consider accessibility** - ensure loading states are announced to VoiceOver users

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

ShimmerKit is available under the MIT license. See the LICENSE file for more info.

## Author

Created by Kaizz Alain Benipayo Angeles

## Acknowledgments

- Inspired by modern skeleton screen best practices
- Built with ❤️ using SwiftUI

---

If you find this useful, please give it a ⭐️!
