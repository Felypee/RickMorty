
# Rick And Morty in Flutter with CLEAN ARQUITECTURE AND GOOD DESIGN PATTERNS

This project runs with this settings:

Flutter 3.16.2 • channel stable • https://github.com/flutter/flutter.git
Tools • Dart 3.2.2 • DevTools 2.28.3


The code was built in VISUAl STUDIO CODE

This project uses FVM 2.4.1 


## This app uses the Clean Architecture
* Organized by Features
  - This allows for integrating new features faster.
* State Management
  - The tool used is Bloc provider, one of the most popular in the Flutter developer community.
* Network Image Load Performance
  - Images are loaded faster than with normal image processors.
* High-Quality Routing
  - A tool that allows the app to navigate between screens faster.


## STEPS TO RUN THE PROJECT

Clone the project

```bash
  git clone https://github.com/Felypee/RickMorty.git
```

Go to the project directory

```bash
  cd RickMorty
```

Install dependencies

```bash
  fvm flutter pub get
```

Install generated files if needed

```bash
  fvm flutter pub run build_runner build
```

Run the app

```bash
  If using VSC, press f5 or fvm flutter run -d (your device id) 
```


To know the device id use

```bash
  fvm flutter devices
```


