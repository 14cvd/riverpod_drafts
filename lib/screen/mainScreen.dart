import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/allProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_circle_outline))
        ],
      ),
      body: FutureBuilder(
        future: ref.read(userNotifierProvider.notifier).fetchUserItem(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var item = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(item[index].title.toString()),
                    subtitle: Text(item[index].body.toString()),
                    leading: InkWell(
                      onTap: () {
                        ref
                            .read(userNotifierProvider.notifier)
                            .remove(item[index]);
                      },
                      child: CircleAvatar(
                        child: Text(item[index].id.toString()),
                      ),
                    ),
                  ),
                );
              },
              itemCount: item!.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Erorr : ${snapshot.error}"),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
