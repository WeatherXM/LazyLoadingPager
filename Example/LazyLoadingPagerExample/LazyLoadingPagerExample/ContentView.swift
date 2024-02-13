//
//  ContentView.swift
//  LazyLoadingPagerExample
//
//  Created by Pantelis Giazitsis on 13/2/24.
//

import SwiftUI
import LazyLoadingPager

struct ContentView: View {
	@State var data: Int = 0

    var body: some View {
		VStack {
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
			HStack {
				Button{
					data -= 1
				} label: {
					Text("-")
				}

				Button{
					data += 1
				} label: {
					Text("+")
				}
			}
		}
        .padding()
    }
}

#Preview {
    ContentView()
}
