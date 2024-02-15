# LazyLoadingPager

![Platform](https://img.shields.io/badge/platform-iOS-lightgrey)
![SwiftVersion](https://img.shields.io/badge/swift-5.7%2B-orange)

`LazyLoadingPager` is a `SwiftUI` component to present multiple views in a horizontal pager layout. The difference with the `SwiftUI` `TabView` with `TabViewStyle.page`
is that `LazyLoadingPager` optimizes the memory usage keeping only the necessary views in memory

## Usage
`LazyLoadingPagerView` is a generic component. Needs to provide some callbacks about the `next` and `previous` data/view to show.
```
@State data: Int = 0

LazyLoadingPagerView(data: $data) { data in
	Text("\(data)")
} previous: { data in
	Text("\(data-1)")
} next: { data in
	Text("\(data+1)")
} previousData: { data in
	data - 1
} nextData: { data in
	data + 1
} scrollDirection: { data0, data1 in
	(data0 < data1) ? .forward : .reverse
}
```

## Installation
LazyLoadingPager is published with Swift Package Manager.

From XCode
- File -> Add Package Dependencies
- Type/paste the following in package url field
```
https://github.com/WeatherXM/LazyLoadingPager
```

## License
LazyLoadingPager is released under [MIT License](https://github.com/WeatherXM/LazyLoadingPager/blob/main/LICENSE)
