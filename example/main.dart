// ignore_for_file: avoid_print

import 'package:pokemon_api/pokemon_api.dart';

 void main() async {
  final api = PokemonAPIClient.instance;

  final test = await api.getPokemonSpecies("908");
  // final test2 = await api.getPokemonSpecies("390");

  // final pokemonList = await api.getPokemonList(PageOptions(limit: 10), maxPages: 1);
  // print('\n');
  // print(pokemonList[0]);
  //
  // final fuecoco = await PokemonAPIClient.instance.getPokemon('389');
  //
  // print('\n');
  // print(fuecoco);
  //
  // final bulbasaur = await PokemonAPIClient.instance.getPokemon('bulbasaur');
  //
  // final encounters = await bulbasaur.locationAreaEncounters.get();
  //
  // print('\n');
  // print(encounters);
  //
  // final locationArea = await encounters[0].locationArea.get();
  //
  // print('\n');
  // print(locationArea);
  //
  // final location = await locationArea.location.get();
  //
  // print('\n');
  // print(location);
  //
  // final region = await location.region.get();
  //
  // print('\n');
  // print(region);
  //
  // final species = await fuecoco.species.get();
  //
  // print('\n');
  // print(species);
}
