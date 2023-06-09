// FontAwesomeImageRepresentable.swift
//
// Copyright (c) 2014-present FontAwesome.swift contributors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

protocol FontAwesomeImageRepresentable: AnyObject {

	typealias ImageConfig = (cssIconName: String, style: FontAwesomeStyle, color: UIColor?, backgroundColor: UIColor?)

	var imageWidth: CGFloat { get }
	var imageConfigs: [ImageConfig] { get }
	
	func createImages(configurationHandler: (_ image: UIImage?, _ index: Int) -> Void)
}

extension FontAwesomeImageRepresentable {

	func createImages(configurationHandler: (_ image: UIImage?, _ index: Int) -> Void) {
		let imgSize = imageSizeForAspectRatio()
		for (index, config) in imageConfigs.enumerated() {
			let img = createImage(config: config, size: imgSize)
			configurationHandler(img, index)
		}
	}

	private func createImage(config: ImageConfig, size: CGSize) -> UIImage? {
		return UIImage.fontAwesomeIcon(code: config.cssIconName,
																	 style: config.style,
																	 textColor: config.color ?? .black,
																	 size: size,
																	 backgroundColor: config.backgroundColor ?? .clear)
	}

	private func imageSizeForAspectRatio() -> CGSize {
		return CGSize(width: imageWidth, height: imageWidth / FontAwesomeConfig.fontAspectRatio)
	}
}
