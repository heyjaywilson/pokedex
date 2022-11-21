# Pokedex

iOS Pokedex app built on Jay's [Twitch](https://twitch.tv/heyjaywilson) and when they have time. It's being built in SwiftUI and in a modularized way. Each feature will have it's own Swift Library.

## Structure

- `./App` - Package for all features
- `./App/Sources/App` - nothing for now
- `./App/Sources/PokeApiService` - Interface that communicates with the PokeAPI
- `./App/Sources/PokeList` - The list of pokemon
- `./App/Sources/Utilities` -Functions and structures that help out different parts of the app
- `./Pokedex` - App Project
- `./Pokedex/Views` - Parent Views that launch into the feature libraries

## Libraries used

- AlamoFire
- SFSafeSymbols
