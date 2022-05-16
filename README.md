# libp2p-app-template

> Clone this repo to get a swift-libp2p template app that makes getting started writing a new app quick and easy!

### How to use
1. Click the ```Use This Template``` button on GitHub (or Clone this repo)
``` bash
git clone https://github.com/swift-libp2p/libp2p-app-template.git
mv libp2p-app-template <yourappname>
cd <yourappname>
rm -rf .git           // remove git history
git init              // re init git if you'd like
open Package.swift
```
2. Configure your server by modifying the ```App/configure.swift``` file
3. Handle you apps custom protocols by replacing the default echo route in ```App/routes.swift```
4. Build & Run!

