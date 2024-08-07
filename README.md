**University Listing App**

A simple iOS application demonstrating the use of VIPER architecture to list and display details of universities using data fetched from an API. The app includes offline support by caching data in a local Realm database.

**Features**

Listing Screen: Fetches and displays a list of universities from an API, caches data locally.
Detail Screen: Displays details of a selected university, allows refreshing the listing.
Offline Support: Uses cached data if the API fails.
Modular Architecture: Uses VIPER architecture to promote separation of concerns and code organization.
Requirements
iOS 13.0+
Xcode 12.0+
Swift 5.0+
Realm

**Architecture**

The application is organized using the VIPER architecture, which promotes separation of concerns and modularity.

**View:** Displays data and relays user interactions to the presenter.
**Interactor:** Handles the business logic and data fetching.
**Presenter:** Acts as the intermediary between the view and the interactor.
**Entity:** Contains the data models.
**Router:** Handles navigation between view controllers.

**Installation**

Clone the repository:
**git clone https://github.com/bhallacharanjit/TahalufTash**

**Install dependencies using CocoaPods:**

pod install

**Open the .xcworkspace file in Xcode:**

open UniversityListingApp.xcworkspace

**Usage**

Build and run the app on a simulator or physical device.
The app will fetch a list of universities from the API and display them on the listing screen.
Tapping on a university will navigate to the detail screen, showing the university's details.
You can refresh the listing by tapping the refresh button on the detail screen, which will re-fetch the data from the API and update the listing.

**API**
The app uses the following API to fetch university data:
http://universities.hipolabs.com/search?country=United%20Arab%20Emirates
**Local Database**
The app uses Realm for local data caching. Data is saved locally when fetched from the API and retrieved from the local cache if the API request fails.
**Unit Tests**
The project includes unit tests for critical parts of the application, including network requests, database operations, and interactions between VIPER components.
**Running Tests**
Open the project in Xcode.
Select the UniversityListingApp scheme.
Press Cmd + U to run the tests.

**Project Structure**
UniversityListingApp/

│
##
├── UniversityListingApp/
##
│   ├── Listing/
##
│   │   ├── Interactor/
│   │   ├── Presenter/
│   │   ├── Router/
│   │   ├── View/
│   │   └── Entity/
│   │
│   ├── Detail/
│   │   ├── Interactor/
│   │   ├── Presenter/
│   │   ├── Router/
│   │   ├── View/
│   │   └── Entity/
│   │
│   ├── Network/
│   ├── Database/
│   └── Resources/
│
├── UniversityListingAppTests/
│
└── Podfile

**Listing Screen:** Fetches and displays a list of universities from an API, caches data locally.
**Detail Screen:** Displays details of a selected university, allows refreshing the listing.
**Offline Support:** Uses cached data if the API fails.
**Modular Architecture:** Uses VIPER architecture to promote separation of concerns and code organization.

**Requirements**
iOS 13.0+
Xcode 12.0+
Swift 5.0+
Realm

**Architecture**
The application is organized using the VIPER architecture, which promotes separation of concerns and modularity.

**View:** Displays data and relays user interactions to the presenter.
**Interactor:** Handles the business logic and data fetching.
**Presenter:** Acts as the intermediary between the view and the interactor.
**Entity:** Contains the data models.
**Router:** Handles navigation between view controllers.
