# SwiftUINavigation

1. [Structure](#structure)
2. [Module components](#module-components)
3. [Navigation](#navigation)


[Video presentation record]([https://chiswdevelopment.sharepoint.com/:v:/s/iOSteam/EQrLndxDdixIvUG6pm1Nm18BTZQfx1Z5HptBtwQp8jKKkA?e=58Xfse](https://chiswdevelopment.sharepoint.com/sites/iOSteam/Shared%20Documents/General/Recordings/%D0%A1%D0%BE%D0%B1%D1%80%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D0%BA%D0%B0%D0%BD%D0%B0%D0%BB%D0%B5%20_General_-20230103_150430-%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D1%8C%20%D1%81%D0%BE%D0%B1%D1%80%D0%B0%D0%BD%D0%B8%D1%8F.mp4?web=1)

## Structure

* Application - contains app's entry point files(AppDelegate, SceneDelegate), app configurations(dev, stg, prod) and 
  * App entry points (AppDelegate, SceneDelegate)
* BusinessLogic
  * Models - response, database, domain entities
  * Services - Independent services and managers
  * Injection - Registering our services in Resolver
* Core
  * Base - Base classes for app's modules
  * Extensions - Extensions for Foundation, UIKit, Combine, other classes/structs
  * Helpers - Independent and reusable tools
  * Views - Reusable views(which can be used twice or more times)
* Presentation - all modules in the app (can be grouped by flow)
* Resources - assets, colors, fonts, strings resources

<img width="357" alt="Screenshot 2023-01-23 at 23 22 46" src="https://user-images.githubusercontent.com/23431222/214152844-6d587161-71d2-4d88-bc90-381d6675e5c6.png">



## Module Components

Each module has 4 main components(can be more if you need to split giant logic in some of them):
  * View
  * Router
  * ViewModel
  * Builder

Which are connected with ViewModel though the bindings. In this case case ViewModel acts as a connector between View and Router.

<img width="913" alt="Screenshot 2023-01-23 at 23 24 46" src="https://user-images.githubusercontent.com/23431222/214153209-4add6ac9-a985-424e-b7f5-40d26c8e8877.png">



### View

- View holds strong reference to ViewModel.
- View listen to ViewModels's publishers.
- View has @State var presentedScreen, every time variable not nil view pushes or presents other View(via ViewModifiers, ex .push, .present)

<img width="689" alt="Screenshot 2023-01-23 at 23 31 51" src="https://user-images.githubusercontent.com/23431222/214154595-985d3b51-6901-45b7-9b91-84fd2143e6ff.png">



### ViewModel

- ViewModel is independent component. 
- Each ViewModel has its own transition publisher where you should notify subscribers(ex. Router) when you should go forward or backward in your flow.
- If ViewModel need some services or parameters, the should be injected with Resolver.
- ViewModel holds strong reference to Router
- ViewModel listens to Routers publishers.


<img width="654" alt="Screenshot 2023-01-23 at 23 57 22" src="https://user-images.githubusercontent.com/23431222/214159089-dde93148-87f2-4c9f-b46f-f95d77c42377.png">



### Router

- Router has enum ...Route where all possible transitions are listed.
- Router has didFinish publisher where you shoud notify subsriber(ex. ViewModel) when you should update.
- Each router confirms to protocol Routing
- Returning next View via func view(for route:)

<img width="702" alt="Screenshot 2023-01-23 at 23 43 59" src="https://user-images.githubusercontent.com/23431222/214156641-01ea8008-26a8-4d37-8468-d6a628ea724d.png">



### Builder

- Builder constructs a Module
- It creates needed components with injecting parameters and wrap it into "Module" type - which is just container with 2 generic types(view and transition, image below)

<img width="568" alt="Screenshot 2023-01-23 at 23 53 43" src="https://user-images.githubusercontent.com/23431222/214158476-0ab16f9c-8c81-4eb1-89f8-40b750b7581c.png">
<img width="345" alt="Screenshot 2023-01-23 at 23 55 14" src="https://user-images.githubusercontent.com/23431222/214158700-112b674a-8914-4f50-b363-67ac83ad046d.png">


## Navigation

<img width="940" alt="Screenshot 2023-01-23 at 23 58 16" src="https://user-images.githubusercontent.com/23431222/214159247-29b19c3d-326c-4a30-82a3-36398d9288f2.png">

- When app starts it opens RootView. RootView has variable presentedScreen, which decides what flow is presented now.
- Router creates next module(via Builder) and passes it to View.

<img width="974" alt="Screenshot 2023-01-24 at 00 21 07" src="https://user-images.githubusercontent.com/23431222/214163185-d57721ba-c4a1-43b6-a3df-d9162c7cafcf.png">

- Each flow has entry view, which is NavigationView, and can push or present child views.

<img width="614" alt="Screenshot 2023-01-24 at 00 22 10" src="https://user-images.githubusercontent.com/23431222/214163360-1fed05cf-be3f-40b7-a451-688e05d26297.png">

<img width="589" alt="Screenshot 2023-01-24 at 00 22 59" src="https://user-images.githubusercontent.com/23431222/214163490-09576af3-453d-4bc8-a034-29e8d0889a66.png">

- In current implementation RootView changes flow when user is created in UserService. Also you can subscribe to a RootRouter didFinishPublisher in RootViewModel for custom logic.
