# libp2p-app-template

> Clone this repo to get a swift-libp2p template app that makes implementing a libp2p server (host) quick and easy!

### How to use
1. Clone this repo
    1. Click the ["Use This Template"](https://github.com/swift-libp2p/libp2p-app-template/generate) button on GitHub 
    2. or clone this repo via cli
``` bash
git clone https://github.com/swift-libp2p/libp2p-app-template.git
```

2. Rename the folder and reinitialize git
```bash
mv libp2p-app-template <yourappname>
cd <yourappname>
rm -rf .git           # remove git history
git init              # re init git if you'd like
open Package.swift
```

3. Configure your server by modifying the ```App/configure.swift``` file

4. Handle your apps custom protocols by replacing the default echo route in ```App/routes.swift```

5. Build & Run!
``` bash
# In your projects root directory
swift build
swift run
```

Other useful commands
``` bash
swift package reset   # resets the dependency cache
swift package update  # updates all of the dependencies
swift test            # runs the tests in /Tests/AppTests
swift run App routes  # prints the protocols your app supports

# specify the host and port to listen on
swift run App serve --hostname 127.0.0.1 --port 10333  

# runs the custom cowsay command 
swift run App cowsay "Mmooo" --eyes "👀" --tongue "👅" 
```

