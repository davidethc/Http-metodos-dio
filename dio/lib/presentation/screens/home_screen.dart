import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_app/infrastrcture/models/pokemon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
Pokemon? pokemon;
int id = 0;
//dynamic pokemoon 

  @override
  void initState(){
    super.initState();
    getPokemon();
  }
  Future<void>getPokemon()async{
    id++;
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id');
   pokemon = Pokemon.fromJson(response.data);
   //pokemon = response.data
   
   setState(() {
    
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petición Http'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Text(pokemon ?['name']??'No hay datos'),
            Text(pokemon?.name??'No hay datos'),
            if (pokemon != null)
            ...[
Image.network(pokemon?.sprites.frontDefault??''),
              Image.network(pokemon?.sprites.backDefault ?? ''),
              Image.network(pokemon?.sprites.frontShiny ?? ''),
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.navigate_next ),
        onPressed: () {
          getPokemon();
        },
      ),
    );
  }
}
