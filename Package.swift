// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lazyapi",
    
    platforms: [
    
      .macOS(.v11),
                .iOS(.v13)
    
    ],
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "lazyapi",
                 targets: ["lazyapi"]),
        
    ],
    
    dependencies: [
      
      .package(url: "https://github.com/hcyrig/NOFoundation.git",
               exact: .init(0, 2, 6))
    
    ],
    
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "lazyapi",
            dependencies: [
              
              .product(name: "NOFoundation",
                       package: "NOFoundation")
            
            ],
            path: "Sources"),
        
    ]
)
