import SwiftUI

public enum Direction {
	case forward
	case reverse

	var toNavigationDirection: UIPageViewController.NavigationDirection {
		switch self {
			case .forward:
					.forward
			case .reverse:
					.reverse
		}
	}
}

public struct LazyLoadingPagerView<Content: View, Data: Hashable>: View {
	@Binding var data: Data
	let initialContent: (Data) -> Content
	let previous: (Data) -> Content?
	let next: (Data) -> Content?
	let previousData: (Data) -> Data?
	let nextData: (Data) -> Data?
	let scrollDirection: (Data, Data) -> Direction

	public init(data: Binding<Data>,
				initialContent: @escaping (Data) -> Content,
				previous: @escaping (Data) -> Content?,
				next: @escaping (Data) -> Content?,
				previousData: @escaping (Data) -> Data?,
				nextData: @escaping (Data) -> Data?,
				scrollDirection: @escaping (Data, Data) -> Direction) {
		_data = data
		self.initialContent = initialContent
		self.previous = previous
		self.next = next
		self.previousData = previousData
		self.nextData = nextData
		self.scrollDirection = scrollDirection
	}

	public var body: some View {
		PagerView(data: $data,
				  content: initialContent,
				  previous: previous,
				  next: next,
				  previousData: previousData,
				  nextData: nextData,
				  scrollDirection: { scrollDirection($0, $1).toNavigationDirection })
		.navigationBarHidden(true)
	}
}

#Preview {
	ZStack {
		Color.red.ignoresSafeArea()

		LazyLoadingPagerView(data: .constant(0)) { data in
			Text("\(data)")
		} previous: { data in
			Text("\(data-1)")
		} next: { data in
			Text("\(data+1)")
		} previousData: { data in
			data - 1
		} nextData: { data in
			data + 1
		} scrollDirection: { _, _ in
				.forward
		}
	}
}

