// ignore_for_file: avoid_print

import 'package:pokemon_api/pokemon_api.dart';

 void main() async {
  final api = PokemonAPIClient.instance;

  final pokemonList = await api.getPokemonList();
  print('\n');
  print(pokemonList[0]);

  final bulbasaur = await pokemonList[0].get();

  print('\n');
  print(bulbasaur);

  final encounters = await bulbasaur.locationAreaEncounters.get();

  print('\n');
  print(encounters);

  final locationArea = await encounters[0].locationArea.get();

  print('\n');
  print(locationArea);
  
  final location = await locationArea.location.get();

  print('\n');
  print(location);

  final region = await location.region.get();
  
  print('\n');
  print(region);

  final species = await bulbasaur.species.get();

  print('\n');
  print(species);
}
