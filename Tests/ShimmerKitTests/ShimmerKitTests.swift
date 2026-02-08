import XCTest
@testable import ShimmerKit

final class ShimmerKitTests: XCTestCase {
    func testShimmerModifierExists() throws {
        // This test verifies that the ShimmerModifier can be instantiated
        let modifier = ShimmerModifier()
        XCTAssertNotNil(modifier)
    }
    
    func testShimmerIfLoadingModifier() throws {
        // This test verifies that the ShimmerIfLoading modifier can be instantiated
        let loadingModifier = ShimmerIfLoading(isLoading: true)
        let notLoadingModifier = ShimmerIfLoading(isLoading: false)
        
        XCTAssertNotNil(loadingModifier)
        XCTAssertNotNil(notLoadingModifier)
    }
}
