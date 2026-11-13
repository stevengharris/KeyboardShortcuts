import Testing
import AppKit
@testable import KeyboardShortcuts

extension KeyboardShortcutsTests {
	@Test
	func `modifier preview lists the held modifiers in menu order`() {
		#expect(KeyboardShortcuts.RecorderCocoa.modifierPreview(for: [.command, .shift]) == "⇧⌘")
		#expect(KeyboardShortcuts.RecorderCocoa.modifierPreview(for: [.command, .option, .control, .shift]) == "⌃⌥⇧⌘")
	}

	@Test
	func `modifier preview is empty when no modifier is held`() {
		#expect(KeyboardShortcuts.RecorderCocoa.modifierPreview(for: []).isEmpty)
	}

	@Test
	func `modifier preview ignores caps lock and function`() {
		#expect(KeyboardShortcuts.RecorderCocoa.modifierPreview(for: [.capsLock, .function]).isEmpty)
		#expect(KeyboardShortcuts.RecorderCocoa.modifierPreview(for: [.capsLock, .command]) == "⌘")
	}
}
