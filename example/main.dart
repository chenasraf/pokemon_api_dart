// ignore_for_file: avoid_print

import 'package:pokemon_api/pokemon_api.dart';

 void main() async {
  final api = PokemonAPIClient.instance;

  final pokemonList = await api.getPokemonList();
  print('\n');
  print(pokemonList[0]);

  final fuecoco = await PokemonAPIClient.instance.getPokemonByNameOrId('fuecoco');

  print('\n');
  print(fuecoco);

  final encounters = await fuecoco.locationAreaEncounters.get();

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

  final species = await fuecoco.species.get();

  print('\n');
  print(species);
}
