// FontAwesomeTextRepresentable.swift
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

protocol FontAwesomeTextRepresentable: FontAwesomeStateRequirement {
	
	var textSize: CGFloat { get }
	var isTextCSSCode: Bool { get }
	var fontStyle: FontAwesomeStyle { get }
	
	func updateText(_ updateTextBlock: () -> Void)
	func updateFontAttributes(forStates stateBlock: (UIControl.State, UIFont) -> Void)
	
}

extension FontAwesomeTextRepresentable {
	
	public func updateText(_ updateTextBlock: () -> Void) {
		guard isTextCSSCode else {
			return
		}
		
		updateTextBlock()
	}
	
	public func updateFontAttributes(forStates stateBlock: (UIControl.State, UIFont) -> Void) {
		let states = type(of: self).supportedStates()
		let font = UIFont.fontAwesome(ofSize: textSize, style: fontStyle)
		
		for state in states {
			stateBlock(state, font)
		}
	}
}
