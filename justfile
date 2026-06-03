set windows-shell := ["powershell.exe", "-c"]
set shell := ["bash", "-cu"]

set-app-package-name name:
    dart run change_app_package_name:main {{ name }}

set-app-icon:
    dart run flutter_launcher_icons

run: 
    flutter run
    
run-windows: 
    flutter run -d windows

run-android:
    flutter run -d android