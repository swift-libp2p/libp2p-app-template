# libp2p-app-template

> Clone this repo to get a swift-libp2p template app that makes getting started writing a new app quick and easy!

### How to use
1. Clone this repo
    1. Click the ["Use This Template"](https://github.com/swift-libp2p/libp2p-app-template/generate) button on GitHub 
    2. or Clone this repo via cli
``` bash
git clone https://github.com/swift-libp2p/libp2p-app-template.git
mv libp2p-app-template <yourappname>
cd <yourappname>
rm -rf .git           # remove git history
git init              # re init git if you'd like
open Package.swift
```
2. Configure your server by modifying the ```App/configure.swift``` file
3. Handle you apps custom protocols by replacing the default echo route in ```App/routes.swift```
4. Build & Run!
``` bash
# In your projects root directory
swift build
swift run Run
...
# other useful commands
swift package reset   # resets the dependency cache
swift package test    # executes the packages tests
swift run Run routes  # prints the protocols your app supports
swift run Run serve --hostname 127.0.0.1 --port 10333  # specify the host and port to listen on
```

