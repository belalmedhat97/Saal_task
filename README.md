# Saal task challenge

The goal is to create a system for managing objects. For example, an object can be a desk, computer, keyboard, server or human being.
Objects have the following attributes: name, description and type 
app done using using MVVM Arc with SwiftUI. 

## App Structure 

**App target**

1. Scenes --> screens of the main app and every scene contains (view, view model, model and subviews) of the screen

2. Core --> contains start screen of the app (SaalTaskApp.swift) 

3. Services --> contains a SwiftData manager for handling all CRUD operation (SwiftDataManager)

4. Routing --> contains Router class for the app using NavigationPath from (NavigationStackManager.swift)


**Test target**

1. View models tests --> contains tests for the 2 view models classes in the app (ItemListViewModel and ItemDetailsViewModel)

2. SwiftData Manager Tests --> contains a standalone test for CRUD operation using (SwiftDataManagerTests.swift)

3. Mock --> contains Mock Data manager for SwiftData and Stubs for the Items with Relations creation (MockDataManager.swift and ItemStubs.swift)


## App details 

the app has 3 screens 

1. **ItemList screen** which has a search bar to search for a Items by the name of items
2. **ItemDetails screen** which has a 3 fields of chosen object to edit and have component to add create relations with another objects and have the functionalty to add and delete relation
3. **RelationItem screen** which has a relation that was selected to be edited when editing object


### Frameworks
| Frameworks |
| :-----------: |
| SwiftUI |
| SwiftData | 

### Packages
| Pacakges |
| :-----------: |
| SwiftLint |

## App Preview


https://github.com/belalmedhat97/Saal_task/assets/51267587/b9663e25-887d-4882-9589-57ef7007a529



## issues faced 

During unit tests of ListDetailsViewModel the SwiftData update and delete make the test crash and the issue was addressed before in here https://stackoverflow.com/questions/76816305/crash-when-accessing-relationship-property-of-swiftdata-model 
the functionlaty works fine in all CRUD opertaion when using the app but when testing the **xcode have crash error crash not failed**

![Screenshot 2024-04-18 at 9 43 40 PM](https://github.com/belalmedhat97/Saal_task/assets/51267587/3685f203-08e6-48e1-82f7-33d5e00e81f8)




