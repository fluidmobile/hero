# HeroArchitecture

[![CI Status](http://img.shields.io/travis/fluidmobile/hero.svg?style=flat)](https://travis-ci.org/fluidmobile/hero)
[![Version](https://img.shields.io/cocoapods/v/HeroArchitecture.svg?style=flat)](http://cocoapods.org/pods/HeroArchitecture)
[![License](https://img.shields.io/cocoapods/l/HeroArchitecture.svg?style=flat)](http://cocoapods.org/pods/HeroArchitecture)
[![Platform](https://img.shields.io/cocoapods/p/HeroArchitecture.svg?style=flat)](http://cocoapods.org/pods/HeroArchitecture)

## Introduction

The `Hero` architecture for iOS is a way to avoid large `UIViewController` implementations and simultaneously separate the responsibilities. This separation is achieved by creating modules and workflows.

Each component of a module has a specific job.

#### View Layer
The `View Layer` is responsable for displaying what the user sees. It takes all of the users inputs, directs it to the `Coordinator` and displays its outputs.

No database entities shall be used in this component. Only use `PONSO`s (Plain Old NSObject) to give the view data to display.

###### Protocols to implement
The ViewController implements the `ViewInput` protocol to handle view updates and optionally the `ViewDelegate`.
###### Sample:
```objc
- (void)updateSuperHeroProfile:(HEROProfilePonso*)profile;
```
#### Router
The `Router` component is a module's connection to a workflow. No database entities or `PONSO`s shall be used in this component.

Use this component to connect to a workflow using the `RouterWorkflowControl` which has to be implemented by the chosen workflow.
###### Protocols to implement
The `Router` component implements a single protocol:
- `RouterInput`

```objc
- (void)didFinishEditingSuperHeroOnRouter:(HEROBaseRouter*)router;
```
#### Coordinator
The `Coordinator` is an abstraction layer separating the view layer, use case and the router from each other. It contains no logic.
###### Protocols to implement
It implements 3 protocols:
  - `ViewOutput`
  - `UseCaseOutput`
  - `RouterOutput`

###### Sample:
  ```objc
  - (void)favoritedSuperHero:(HEROProfilePonso*)profile;
  ```

#### UseCase

The `UseCase` component is responsable for the business logic of your app.
Use this component to create your `PONSO` (Plain Old NSObject) from your entities or update the entities using new data. It also responds, saves or handles user input, and sends update messages to the `Coordinator` using the `UseCaseOutput` protocol.

###### Protocols to implement
A use case implements a single protocol: `UseCaseInput`.

###### Sample:
```objc
- (void)favoritedSuperHero:(HEROProfilePonso*)profile;
```

## Requirements
  * Xcode 9+
  * iOS 9+

## Installation

HeroArchitecture is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HeroArchitecture'
```
## Usage
This pod provides the base implementation for the `Hero` architecture. These classes are needed to provide you with a quick and easy way to build your next app using the `Hero` architecture.

The `Hero` architecture is based on modules, which are defined by use cases, and workflows to determine the next screen/workflow.

There are two options to create modules based on this pod:
   * Automatically generate a module using 'Generamba'
   * Manually subclass each component

###  Automatically generate a module using `Generamba`

This is the fastest way to create a `Hero` module. You can use the provided templates or create your own [template](https://github.com/rambler-digital-solutions/Generamba/wiki/Template-Structure).

#### 1. Install `Generamba`
Run the command `gem install generamba`.

#### 2. Setup `Generamba`
To setup `Generamba` simply run the command `generamba setup` and follow the steps.

#### 3. Install a template
Open the `Rambafile` and modify the template source like this:

```
templates:
- {name: HeroTemplate, git: 'https://github.com/fluidmobile/HeroTemplate'}
```

After adding the template source run the command `generamba install template` to install the template.

#### 4. Generate a module
Once `Generamba` is set up correctly just run the command `generamba gen [MODULE_NAME] [TEMPLATE_NAME]` to create your module from the template.

##### Sample
```ruby
generamba gen Login heroTemplate
```
Creating a workflow can be done the same way. However if your module has a workflow you need to add the router to workflow protocol manually.

### Manually subclass each component

If you choose to create your modules manually, you have to subclass these classes to create a module:
- View Layer
  - `HEROBaseViewController`
  - `HEROBaseView`
- Coordinator
    - `HEROBaseCoordinator`
- Router
  - `HEROBaseRouter`
- UseCase
  - `HEROBaseUsecase`

Additionally you need to add a single header file to declare your View-, Router-, UseCase-Inputs and Output protocols and override the base classes base protocol methods.

Creating a workflow can be done the same way. However if your module has a workflow you need to add the router to workflow protocol manually.

## Documentation

Detailed documentation is available [here](https://github.com/fluidmobile/hero-documentation).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

fluidmobile GmbH, hello@fluidmobile.de

## License

HeroArchitecture is available under the MIT license. See the LICENSE file for more info.
