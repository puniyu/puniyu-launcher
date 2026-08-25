set windows-shell := ["powershell.exe", "-c"]
set shell := ["bash", "-cu"]

set-app-package-name name:
    dart run change_app_package_name:main {{ name }}

set-app-icon:
    dart run flutter_launcher_icons

set-app-name:
    dart run rename_app:main

gen:
    just gen-l10n
    just gen-runner
gen-l10n:
    flutter gen-l10n

gen-runner:
    dart run build_runner build
run: 
    flutter run
    
run-windows: 
    flutter run -d windows

run-android:
    flutter run -d android