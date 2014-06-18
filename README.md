# EightTracksSwift

An implementation of [8tracks](http://8tracks.com/) client in Swift for iOS8.

## How to run

You will need [Cocoapods](http://cocoapods.org/) installed on your machine. After cloning this repo run ``pod install`` and open ``.xworkspace`` file in your XCode 6.

Also you will need your own API key which you can get at [8tracks developers page](http://8tracks.com/developers). Use ``ConfigSample.swift`` file to paste the key and then rename file into ``Config.swift``. It should look like this:

```Swift
let API_URL = "http://8tracks.com"
let API_KEY = "YOUR API KEY"
```

## Implementation details

### MVVM

### Tests

## References

- Dmitri Voronianski @voronianski
- Based on concept and art by [Ionut Zamfir](https://dribbble.com/shots/1578766-Choose-songs)
