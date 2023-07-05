Pokemon API client for Flutter/Dart projects.

Credits to https://pokeapi.co for the API itself.

## Features

- Fully typed and documented
- Easy fetching of linked resources
- Swappable cache

## Getting started

After installing, import and get a reference to the client.

You can use the default instance, or swap it with your own.

```dart
import 'package:pokemon_api/pokemon_api.dart';

// optionally swap the instance
PokemonAPIClient.setInstance(PokemonAPIClient());

// access the swapped (or default) instance
final api = PokemonAPIClient.instance;
```

## Usage

You can see [examples/main.dart] for more examples.

```dart
// get the pokemon list

final pokemonList = PokemonAPIClient.getPokemonList();

// get a specific pokemon
final charmander = PokemonAPIClient.getPokemonByNameOrId('charmander');
final charmander = PokemonAPIClient.getPokemonByNameOrId('4');

// easily get linked references
final encounters = await charmander.locationAreaEncounters.get();
final locationArea = await encounters[0].locationArea.get();
final forms = await charmander.forms.map((f) => f.get()).toList();
```

## Contributing

I am developing this package on my free time, so any support, whether code, issues, or just stars is
very helpful to sustaining its life. If you are feeling incredibly generous and would like to donate
just a small amount to help sustain this project, I would be very very thankful!

<a href='https://ko-fi.com/casraf' target='_blank'>
  <img height='36' style='border:0px;height:36px;'
    src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3'
    alt='Buy Me a Coffee at ko-fi.com' />
</a>

I welcome any issues or pull requests on GitHub. If you find a bug, or would like a new feature,
don't hesitate to open an appropriate issue and I will do my best to reply promptly.

