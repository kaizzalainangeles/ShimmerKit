//
//  Shimmer.swift
//  ShimmerKit
//
//  A lightweight shimmer effect for SwiftUI skeleton screens
//

import SwiftUI
import Combine

/// A view modifier that applies an animated shimmer effect
public struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = -1
    
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geo in
                    let width = geo.size.width
                    let height = geo.size.height
                    
                    LinearGradient(
                        stops: [
                            .init(color: .clear, location: 0.3),
                            .init(color: .white.opacity(0.5), location: 0.5),
                            .init(color: .clear, location: 0.7)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: width * 3, height: height)
                    .offset(x: -width + (phase * width * 2))
                }
            )
            .onAppear {
                startAnimation()
            }
            .clipped()
    }
    
    private func startAnimation() {
        withAnimation(.default) {
            phase = -1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                phase = 1
            }
        }
    }
}

/// A view modifier that conditionally applies shimmer effect based on loading state
public struct ShimmerIfLoading: ViewModifier {
    let isLoading: Bool
    
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    public func body(content: Content) -> some View {
        if isLoading {
            content.modifier(ShimmerModifier())
        } else {
            content
        }
    }
}

// MARK: - View Extensions

public extension View {
    /// Applies a shimmer animation effect to the view
    ///
    /// Perfect for skeleton screens and loading states.
    ///
    /// Example:
    /// ```swift
    /// Text("Loading...")
    ///     .redacted(reason: .placeholder)
    ///     .shimmer()
    /// ```
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
    
    /// Conditionally applies shimmer effect based on loading state
    ///
    /// Example:
    /// ```swift
    /// Text(viewModel.title)
    ///     .redacted(reason: viewModel.isLoading ? .placeholder : [])
    ///     .shimmer(isLoading: viewModel.isLoading)
    /// ```
    func shimmer(isLoading: Bool) -> some View {
        self.modifier(ShimmerIfLoading(isLoading: isLoading))
    }
}
