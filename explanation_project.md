//Then you can generate Freezed files with:
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner build
//-------------------------freeze
Standard Dart classes are "mutable" by default, meaning you can change their values after they are created. While this seems easy, it leads to bugs in complex apps because you might accidentally change a variable in one part of the app that breaks another part.
Freezed solves this by automating the creation of Immutable Classes.
Once you create a Freezed object, it cannot be changed—you must create a new "copy" of it to update values.
