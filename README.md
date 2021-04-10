# BWeird Flutter Toolkit!

Hi! From a Weirder
Flutter has been great on mobile development and I took this opportunity to make it even greater with template toolkit.

This template toolkit will be implemented in MVC+S structure and helper classes. 

[GetX State Management](https://pub.dev/packages/get) will be used as core state management in the project. You can check GetX. It is one of the best state management in Flutter.

# Structure

    controllers
    --- todo_controller.dart
    --- user_controller.dart
    --- tab_index_controller.dart 
    views
    --- login
	------ login_view.dart
    --- home
    ------ todo_tab
    --------- todo_tab_view.dart
    ------ profile_tab
    --------- profile_tab_view.dart
    ------ home_body_widget.dart
    ------ home_drawer_widget.dart
    ------ home_bottom_tab_widget.dart
    ------ home_view.dart 
    models
    --- user_model.dart
    --- todo_model.dart
    --- todo_model.g.dart
    services
    --- http_client.dart
    --- user_http_services.dart
    --- item_http_services.dart
    shared
    --- helper.dart
    --- components
    ------ app_bar_widget.dart
    ------ form_text_widget.dart
    --- cell
    ------ todo_cell_widget.dart
    ------ empty_cell_widget.dart
    themes
    --- text_style.dart
    --- color.dart
    constants
    --- key.dart
	
	
## Libraries


- get:
- json_annotation: ^3.1.0
- qr_code_scanner: ^0.4.0
- camera: ^0.8.1
- get_storage: ^2.0.2
- shared_preferences: ^2.0.5
- http:

## Features

- Bottom Tab Bar
- Drawer
- Http client with basic auth and token
- Key-Value Storage
- MVC+S
- Custom Font
- Shared Widgets

## Screenshot

![enter image description here](https://firebasestorage.googleapis.com/v0/b/hubgit-cea1c.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-04-10%20at%2016.54.10.png?alt=media&token=5c99428c-3301-4099-aa16-8655736565fa)
![enter image description here](https://firebasestorage.googleapis.com/v0/b/hubgit-cea1c.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-04-10%20at%2016.54.04.png?alt=media&token=78a579c0-6bf4-494a-8bc2-9fed86956449)
![enter image description here](https://firebasestorage.googleapis.com/v0/b/hubgit-cea1c.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-04-10%20at%2016.53.59.png?alt=media&token=1f9aa891-30e2-42c5-b13d-e1312107cc2d)
![enter image description here](https://firebasestorage.googleapis.com/v0/b/hubgit-cea1c.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-04-10%20at%2016.53.53.png?alt=media&token=202edb1d-9c26-4b7b-a02f-3101216222f6)



