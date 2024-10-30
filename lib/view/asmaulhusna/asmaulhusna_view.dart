import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/view/asmaulhusna/asmaulhusnaa_bloc/asmaulhusna_bloc.dart';

class AsmaulHusnaScreen extends StatelessWidget {
  const AsmaulHusnaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asmaul Husna'),
      ),
      body: BlocProvider(
        create: (context) => AsmaulhusnaBloc()..add(GetAsmaulHusna()),
        child: BlocBuilder<AsmaulhusnaBloc, AsmaulhusnaState>(
          builder: (context, state) {
            if (state is AsmaulhusnaInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AsmaulhusnaLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: state.asmaulhusna.length,
                itemBuilder: (context, index) {
                  final husna = state.asmaulhusna[index];
                  return Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            husna.arab,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(height: 4.0),
                          Text(husna.latin,
                              style: const TextStyle(
                                  fontSize: 16.0, fontStyle: FontStyle.italic)),
                          const SizedBox(height: 4.0),
                          Text(
                            husna.indo,
                            style: const TextStyle(fontSize: 14.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is AsmaulhusnaError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
