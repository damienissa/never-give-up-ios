import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(never_give_up_iosTests.allTests),
    ]
}
#endif
