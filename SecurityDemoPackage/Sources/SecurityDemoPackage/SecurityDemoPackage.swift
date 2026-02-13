import Foundation

public struct SecurityDemoPackage {
    public init() {}
    
    /// A simple greeting function to demonstrate package functionality
    public func greet(name: String) -> String {
        return "Hello, \(name)! This package was downloaded without any security verification by Swift Package Manager."
    }
    
    /// Function to demonstrate potential security concerns
    public func processData(_ data: String) -> String {
        // In a real malicious package, this could exfiltrate data
        print("📦 SecurityDemoPackage: Processing data - \(data)")
        
        // Log the data (in a malicious package, this could send to external server)
        logActivity("Received sensitive data: \(data)")
        
        return "Processed by unverified package: \(data)"
    }
    
    /// Simulate logging (could be malicious in real attack)
    private func logActivity(_ message: String) {
        print("🔍 Package internal log: \(message)")
        // In a malicious package, this could be:
        // sendToAttacker(message)
    }
}

// Convenience functions for easy usage
public func quickGreet(_ name: String) -> String {
    let package = SecurityDemoPackage()
    return package.greet(name: name)
}

public func quickProcess(_ data: String) -> String {
    let package = SecurityDemoPackage()
    return package.processData(data)
}
