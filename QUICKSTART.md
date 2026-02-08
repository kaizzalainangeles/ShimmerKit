# Quick Start Guide

Get started with ShimmerKit in 3 minutes!

## Installation

Add to your project via Swift Package Manager:

```
https://github.com/kaizzalainangeles/ShimmerKit
```

## Basic Usage

### 1. Import ShimmerKit

```swift
import ShimmerKit
```

### 2. Add Shimmer to Your View

```swift
struct MyView: View {
    var body: some View {
        Text("Loading...")
            .redacted(reason: .placeholder)
            .shimmer()
    }
}
```

### 3. Use with Loading States

```swift
struct ContentView: View {
    @State private var isLoading = true
    @State private var data: String = "Placeholder"
    
    var body: some View {
        VStack {
            Text(data)
                .redacted(reason: isLoading ? .placeholder : [])
                .shimmer(isLoading: isLoading)
        }
        .onAppear {
            loadData()
        }
    }
    
    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            data = "Loaded Content!"
            isLoading = false
        }
    }
}
```

## Common Patterns

### List Skeletons

```swift
List {
    if isLoading {
        ForEach(0..<5, id: \.self) { _ in
            SkeletonRow()
                .shimmer()
        }
    } else {
        ForEach(items) { item in
            ItemRow(item: item)
        }
    }
}
```

### Card Skeletons

```swift
VStack(alignment: .leading) {
    HStack {
        Circle()
            .frame(width: 50, height: 50)
        VStack(alignment: .leading) {
            Text("User Name")
            Text("Subtitle")
        }
    }
    Text("Content goes here with multiple lines")
}
.redacted(reason: .placeholder)
.shimmer()
```

## Next Steps

- Check out the [full README](../README.md) for more examples
- Run the demo app in `Examples/ShimmerKitDemo`
- Read the [API documentation](../README.md#api-reference)

Happy shimmering! ✨
