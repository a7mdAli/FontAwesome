# FontAwesome

A Swift package for using [Font Awesome](https://fontawesome.com/) icons in your iOS, macOS, watchOS, and tvOS apps.

This package is a port of the [FontAwesome.swift](https://github.com/thii/FontAwesome.swift) library by [Thi Doãn](https://github.com/thii), adapted to work with the Swift Package Manager.

## Installation


### Swift Package Manager

To install FontAwesome using Swift Package Manager, add the following line to your `Package.swift` file:

```swift
.package(url: "https://github.com/a7mdAli/FontAwesome.git", from: "1.0.0")
```

Then, add `"FontAwesome"` to the dependencies array of your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "FontAwesome", package: "FontAwesome")
    ]
)
```

### Xcode Project

To add FontAwesome to your Xcode project:

1. Open your project in Xcode.
2. Select your project in the Project navigator.
3. Click on your target in the Targets list.
4. Click on the "General" tab.
5. Scroll down to the "Frameworks, Libraries, and Embedded Content" section.
6. Click on the "+" button.
7. Select "Add Other..." from the dropdown menu.
8. Click on "Add Package Dependency...".
9. In the "Choose Package Repository" window, enter the URL of this package (e.g. `https://github.com/your-username/FontAwesome.git`) and click "Next".
10. Select the version you want to use and click "Next".
11. Choose the target you want to add the package to and click "Finish".
12. Import the package in your Swift files using `import FontAwesome`.

## Usage

Usage of FontAwesome is identical to the original library. Please refer to the [original documentation](https://github.com/thii/FontAwesome.swift#examples) for more information.

## Acknowledgments

This package is a port of [FontAwesome.swift](https://github.com/thii/FontAwesome.swift), originally created by [Thi Doãn](https://github.com/thii).

## License

FontAwesome is released under the MIT license. See [LICENSE](LICENSE) for details.
