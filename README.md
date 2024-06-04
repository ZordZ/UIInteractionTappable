# UISubscribable

UISubscribable - allow you to add target to UIControl and etc without using @objc methods based on Combine.
It opens hole new world to protocoled dedicated implementations of UI.
Look Demo for more info and self configurable vc example.


## Simple examples


### UIBarButtonItem
```swift
    import UISubscribable
    
    var somePlainButton: UIBarButtonItem {
        UIBarButtonItem(title: "somePlain", style: .plain, subscriptions: &subscriptions) { _ in
            print("Tapped")
        }
    }
```

### UITapGestureRecognizer(and other gestures)
```swift
    private var tapGesture: UITapGestureRecognizer {
        UITapGestureRecognizer(subscriptions: &subscriptions) { [weak self] _ in
            print("Tapped")
        }
    }


    private var tapGesture: UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer()
        gesture.registerTap(subscriptions: &subscriptions) { [weak self] _ in
            print("Tapped")
        }
        return gesture
    }


    private var tapGesture: UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer()
        gesture
            .publisher
            .sink { [weak self] _ in
                print("Tapped")
            }
            .store(in: &subscriptions)
        return gesture
    }


    lazy var tapGesture: UITapGestureRecognizer = {
        UITapGestureRecognizer(with: view, subscriptions: &subscriptions) { [weak self] _ in
            print("Tapped")
        }
    }()
```

## Installation
```swift

dependencies: [
    .package(url: "https://github.com/ZordZ/UISubscribable.git", .upToNextMajor(from: "1.0.0"))
]

```

## None Combine
Here none combine version - https://github.com/ZordZ/ActionClosurable
