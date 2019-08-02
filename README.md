#  DoorDash Lite

## Explanation of Patterns
### Coordinator
- The Coordinator pattern allows for separation of navigation code that is easily testable, as it is removed from the view controller level. The Coordinator encapsulates business logic and componentizes specific user flows. 
- The use of the pattern for this project is overkill, but serves to demonstrate how it may be implemented.

### Mix of Storyboard and Programatic Views
- The mix use case serves only as a demonstration for this project. Ideally, the project would stick with either storyboards/xibs or programatic layouts. 

### BaseView
- The BaseView pattern allows for coupling between viewcontrollers and the type of rootViews. 

### Theme
- Theming usually involves having a design system for fonts, weights, sizing, colors, etc. Theming is loosely initialized in `extension UILabel` A full theme system would be a part of all UIViews. Depending on requirements, the theme could change at compile time or runtime. 

## Optimizations
- All strings should be localized. Static accessors should be used to map the keys to strings.
- Provider pattern for network requests should be used to increase testability. Also allows for ability to mock/stub network requests. 
- Encapsulate `MapViewController` in a Coordinator to increase testability.

## Known Issues
- Annotation is made initially on launch, since the map center is updating. 
- Popping to map view re-centers map view to user's current location.

