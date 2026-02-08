# ShimmerKitDemo Setup Guide

This demo app showcases ShimmerKit in action with a realistic feed UI.

## Quick Setup

### Option 1: Create in Xcode (Recommended)

1. Open Xcode
2. File → New → Project
3. Choose **iOS** → **App**
4. Fill in:
   - Product Name: `ShimmerKitDemo`
   - Interface: **SwiftUI**
   - Language: **Swift**
5. Save in `Examples/ShimmerKitDemo`
6. Add ShimmerKit package:
   - File → Add Package Dependencies
   - Click "Add Local..."
   - Navigate to the root `ShimmerKit` folder (two levels up)
   - Click "Add Package"
7. Copy the provided source files:
   - `ShimmerKitDemoApp.swift`
   - `ContentView.swift`
8. Build and run!

### Option 2: Use Existing Files

The demo source files are already in this directory:
- `ShimmerKitDemo/ShimmerKitDemoApp.swift` - App entry point
- `ShimmerKitDemo/ContentView.swift` - Main demo view

Just create a new Xcode project and drag these files in, then add the ShimmerKit package dependency.

## What the Demo Shows

The demo app demonstrates:
- ✨ Skeleton screens with shimmer effect
- 🔄 Loading state management
- 📱 Realistic feed UI with posts
- 🎯 Best practices for using ShimmerKit

## Running the Demo

1. Press `Cmd + R` or click the Play button
2. The app will show skeleton screens with shimmer for 3 seconds
3. Click "Refresh" to see the loading state again

## Customizing

Feel free to modify the demo to experiment with:
- Different shimmer durations
- Custom skeleton designs
- Various loading patterns
- Additional UI components
