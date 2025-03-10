// UISliderExtensionsTests.swift - Copyright 2023 SwifterSwift

@testable import SwifterSwift
import XCTest

#if os(iOS)
import UIKit

final class UISliderExtensionsTests: XCTestCase {
    func testCompletionCalledAnimated() {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        let exp = expectation(description: "calledCompletion")
        slider.setValue(90, animated: true, duration: 0.5) {
            XCTAssertEqual(slider.value, 90.0)
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

    func testSetValue() {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        var completionCalled = false

        slider.setValue(99) {
            completionCalled = true
            XCTAssert(completionCalled)
        }
        XCTAssertFalse(completionCalled)
        XCTAssertEqual(slider.value, 99)
    }

    func testCompletionCalled() {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        let exp = expectation(description: "calledCompletion")
        slider.setValue(50, animated: false, duration: 2) {
            XCTAssert(true)
            exp.fulfill()
        }
        XCTAssertEqual(slider.value, 50.0)
        waitForExpectations(timeout: 3)
    }
}

#endif
