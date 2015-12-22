**PredicatePal** is a Swift DSL for building `NSPredicate` objects.

`NSPredicate` is a Foundation class that specifies how data should be fetched or filtered. The class is an integral part of many other system frameworks such as CloudKit, CoreData, Contacts, EventKit and HealthKit. Its query language is expressive and natural, but since it's typically built by a runtime parser, it can be hard to figure out and slow to build.

**PredicatePal** replaces this query language with a compile-time DSL. Using the magic of Swift generics and operator overloading, this framework:

* **Checks syntax at compile time.** No more crashes with query syntax errors, get Xcode autocompletion and Quick Help on your side!
* **Prevents type errors.** Can't combine expressions of incompatible types.
* **Plugs into the type system.** Mix and match `NSPredicate` terms with Swift constants and expressions.
* **Runs fast.** 2x the speed of the runtime parser.
* **Has unit tests.**

Install
-------

As an independent project:

* In the Terminal, run `git clone https://github.com/pixelglow/PredicatePal.git`.
* Within the *ZipZap* directory, open the *PredicatePal.xcodeproj* Xcode project.
* In the Xcode project, select either the *PredicatePal (iOS)*, *PredicatePal (OS X)* or *PredicatePal (tvOS)* scheme from the drop down.
* You can now build, test (OS X only) or analyze with the selected scheme.
* The built frameworks and test cases are in a subdirectory of *~/Library/Developer/Xcode/DerivedData*.

Using [Carthage](https://github.com/Carthage/Carthage):

* In your `Cartfile`, specify `github "pixelglow/PredicatePal"`.
* Run `carthage update` to build.

Use
---

Import:

	import PredicatePal

Build an `NSPredicate`:

	let age: Key<Int>("age")
	let predicate = *(age < 21 || age > 42) // NSPredicate(format:"age < 21 OR age > 42")

Getting started: [Tutorial](https://github.com/pixelglow/PredicatePal/wiki/Tutorial)

Full syntax guide: [Syntax](https://github.com/pixelglow/PredicatePal/wiki/Syntax)

Require
-------

* **Build**: Xcode 7 and later.
* **Link**: Only system libraries; no third-party libraries needed.
  * *CoreLocation.framework*
  * *Foundation.framework*
* **Run**: Mac OS X 10.10 (Yosemite) or iOS 8.0 and later.

Support
-------

* Follow us on Twitter: [@pixelglow](http://twitter.com/pixelglow).
* Raise an issue on [PredicatePal issues](https://github.com/pixelglow/PredicatePal/issues).

License
-------

*PredicatePal* is licensed with the BSD license.

Donate
------

* Tip with [ChangeTip](http://pixelglow.tip.me).


