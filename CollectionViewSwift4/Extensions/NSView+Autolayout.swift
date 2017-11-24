//

import Foundation
import AppKit

// --------------------------------------------------------------------------------
// auto layout
// --------------------------------------------------------------------------------

extension NSView {
	
	@discardableResult
	public func pbbPlace(view: NSView, inset:CGFloat) -> [NSLayoutConstraint] {
		return pbbPlace(view, at:(inset, inset, inset, inset))
	}
	
	@discardableResult
	public func pbbPlace(_ view: NSView, at tuple:(CGFloat?, CGFloat?, CGFloat?, CGFloat?) = (0,0,0,0)) -> [NSLayoutConstraint] {
		var res: [NSLayoutConstraint] = []
		
		let (top, left, bottom, right) = tuple
		
		if let inset = top {
			let c = NSLayoutConstraint( item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		if let inset = left {
			let c = NSLayoutConstraint( item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		if let inset = bottom {
			let c = NSLayoutConstraint( item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		if let inset = right {
			let c = NSLayoutConstraint( item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		
		addConstraints(res)
		
		return res
	}
	
	@discardableResult
	public func pbbPlaceInCenter(_ view:NSView, withOffset offset:(CGFloat, CGFloat) = (0,0)) -> [NSLayoutConstraint] {
		let c1 = NSLayoutConstraint( item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: offset.0)
		let c2 = NSLayoutConstraint( item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: offset.1)
		
		addConstraints([c1, c2])
		
		return [c1, c2]
	}
	
}

