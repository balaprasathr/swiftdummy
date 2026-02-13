import XCTest
@testable import SecurityDemoPackage

final class SecurityDemoPackageTests: XCTestCase {
    func testGreeting() throws {
        let package = SecurityDemoPackage()
        let result = package.greet(name: "TestUser")
        XCTAssertTrue(result.contains("Hello, TestUser!"))
        XCTAssertTrue(result.contains("without any security verification"))
    }
    
    func testDataProcessing() throws {
        let package = SecurityDemoPackage()
        let result = package.processData("test-data")
        XCTAssertEqual(result, "Processed by unverified package: test-data")
    }
    
    func testQuickGreet() throws {
        let result = quickGreet("World")
        XCTAssertTrue(result.contains("Hello, World!"))
    }
    
    func testQuickProcess() throws {
        let result = quickProcess("sample-data")
        XCTAssertEqual(result, "Processed by unverified package: sample-data")
    }
}
