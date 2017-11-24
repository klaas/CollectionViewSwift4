//

import Foundation
import AppKit

class LabelCollectionViewItem2: NSCollectionViewItem {
	
	// MARK: properties
	
	var labelObject:LabelObject? {
		didSet {
			label.stringValue = "P: " + (labelObject?.title ?? "")
		}
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
	
	// MARK: view properties
	
	var label:NSTextField!
	
	// MARK: NSViewController
	
	override func loadView() {
		self.view = LabelCollectionViewItemView(frame: NSRect(x: 0, y: 0, width: 200, height: 30)) // we use auto layout and the collection view's layout will specify the size eventually
		self.view.wantsLayer = true
		self.view.layer!.backgroundColor = NSColor.green.cgColor
		
		label = {
			let v = NSTextField()
			v.isSelectable = false
			v.isEditable = false
			v.drawsBackground = false
			v.isBezeled = false
			v.translatesAutoresizingMaskIntoConstraints = false
			v.alignment = .center
			v.font = NSFont.systemFont(ofSize: 20)
			v.backgroundColor = NSColor.green.withAlphaComponent(0.2)
			return v
		}()
		
		self.view.addSubview(label)
		self.view.pbbPlaceInCenter(label)
	}
	
	// MARK: NSResponder
	
	override func mouseDown(with event: NSEvent) {
		if event.clickCount == 2 {
			print("Double click \(labelObject!.title)")
		} else {
			super.mouseDown(with: event)
		}
	}
}
