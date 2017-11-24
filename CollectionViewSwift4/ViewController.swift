//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

	// MARK: properties
	
	var strings = ["Peter", "Florian", "Ruediger", "John", "Paul", "George", "Ringo"].sorted()
	
	@IBOutlet weak var collectionView1: NSCollectionView!
	var collectionView2: NSCollectionView!

	// MARK: NSViewController
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// --------------------------------------------------------------------------------
		// configure collection view from interface builder
		// --------------------------------------------------------------------------------

		collectionView1.dataSource = self
		collectionView1.delegate = self
		collectionView1.register(LabelCollectionViewItem2.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("item"))

		// --------------------------------------------------------------------------------
		// setup programmatic collection view programmatically
		// --------------------------------------------------------------------------------
		
		let scrollView:NSScrollView = {
			let v = NSScrollView(frame: NSRect.zero)
			v.translatesAutoresizingMaskIntoConstraints = false
			v.hasVerticalRuler = false
			v.hasVerticalScroller = true
			return v
		}()
		
		collectionView2 = {
			let v = NSCollectionView(frame: NSRect.zero)
			v.wantsLayer = true
			v.layer!.backgroundColor = NSColor.blue.withAlphaComponent(0.2).cgColor
			v.isSelectable = true
			v.allowsEmptySelection = false
			v.collectionViewLayout = {
				let l = NSCollectionViewFlowLayout()
				l.minimumInteritemSpacing = 10
				l.minimumLineSpacing = 10
				l.scrollDirection = NSCollectionView.ScrollDirection.horizontal
				l.sectionInset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
				l.itemSize = CGSize(width: 150, height: 60)
				return l
			}()
			
			return v
		}()
		
		// --------------------------------------------------------------------------------
		// configure programmatic collection view
		// --------------------------------------------------------------------------------
		
		collectionView2.register(LabelCollectionViewItem2.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("item"))
		collectionView2.dataSource = self
		collectionView2.delegate = self
		scrollView.documentView = collectionView2
		
		view.addSubview(scrollView)
		
		view.pbbPlace(scrollView, at:(300,0,0,0))
	}

	// MARK: NSCollectionViewDataSource

	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return strings.count * 5
	}

	func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		let lo = LabelObject(title: strings[indexPath.item % strings.count])
		
		if indexPath.item % 2 == 0 {
			let item = collectionView.makeItem(withIdentifier:NSUserInterfaceItemIdentifier("LabelCollectionViewItem1"), for: indexPath)
			item.representedObject = lo
			return item
		} else {
			let item = collectionView.makeItem(withIdentifier:NSUserInterfaceItemIdentifier("item"), for: indexPath) as! LabelCollectionViewItem2
			item.labelObject = lo
			return item
		}
	}

	// MARK: NSCollectionViewDelegate
	
	func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
		if collectionView == self.collectionView1 {
			print("Interface Builder collection view: did select \(indexPaths)")
		} else {
			print("Programmatic collection view: did select \(indexPaths)")
		}
		
	}
}

