import SwiftUI

struct LazyLoadingPagerView<Content: View, Data: Hashable>: View {
	@Binding var data: Data
	let initialContent: (Data) -> Content
	let previous: (Data) -> Content?
	let next: (Data) -> Content?
	let previousData: (Data) -> Data?
	let nextData: (Data) -> Data?
	let scrollDirection: (Data, Data) -> UIPageViewController.NavigationDirection

	var body: some View {
		PagerView(data: $data,
				  content: initialContent,
				  previous: previous,
				  next: next,
				  previousData: previousData,
				  nextData: nextData,
				  scrollDirection: scrollDirection)
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

