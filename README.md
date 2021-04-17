# RxSwift with Viper

 Fetching Bus Schedule for Stations
 
 ## Design Pattern
 
 I have built the project as "RxSwiftViper" app and it doesn't use any storyboard or xib file. I also have used VIPER architecutre as it gives better reusability. I had gone through several forums discussions to analyze comparision between MVVM & VIPER and concluded that VIPER is better option for a larger team working on the same project as it supports more scalability. Below is one link that gives high level comparison of both:
 https://medium.com/developermind/blurring-the-lines-between-mvvm-and-viper-dcb3dc9815ac
 
 ## Dependencies
 
 Apart from Rx frameworks for reactive programing, I have used:
 - Moya for API layer abstraction
 - SnapKit for autolayouts
 - Quick & Nimble for unit testing
 
 ## Project Structure
 
 Project is divided into different folders:
  - Network: API Layer abstraction using Moya
  - Utils: Includes common functionality like loading indicator & extensions and constants files colors, fonts & string literals.
  - Features: Includes 2 main UIs for the assignment as Stations and Bus Schedule  - Entity: includes model for all data responses
  
  ## Logic
  
- Stations and Bus Schedule implement VIPER pattern in swift with each folder defining: view, presenter, and interactor. 
- Bus Stations are hardcoded but are implemented in a way that API service can be used. 
- Bus Schedule fetches data for given Bus Station and groups them into departure and arrival array models based on date. When direction button is tapped, deparature and arrivals are switched. Pull to referesh will fetch and update data again.
  
  ## Testing
  
  Some basic unit tests are included for views, models and API calls. More tests can be added.
  
