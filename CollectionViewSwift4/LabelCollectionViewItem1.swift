//

import Foundation
import AppKit

class LabelCollectionViewItem1: NSCollectionViewItem {
	
	// MARK: properties
	
	var labelObject:LabelObject? {
		return representedObject as? LabelObject
	}
	
	// MARK: NSCollectionViewItem
	
	override var isSelected: Bool {
		didSet {
			(self.view as! LabelCollectionViewItemView).isSelected = isSelected
		}
	}
	
	override var highlightState: NSCollectionViewItem.HighlightState {
		didSet {
			(self.view as! LabelCollectionViewItemView).highlightState = highlightState
		}
	}
	
	// MARK: outlets
	
	@IBOutlet weak var label: NSTextField!
	
	// MARK: NSResponder

	override func mouseDown(with event: NSEvent) {
		if event.clickCount == 2 {
			print("Double click \(labelObject!.title)")
		} else {
			super.mouseDown(with: event)
		}
	}
}
