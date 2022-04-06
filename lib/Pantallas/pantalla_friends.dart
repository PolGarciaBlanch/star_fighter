import 'package:flutter/material.dart';
import 'package:star_fighter/control/dbData.dart';

class list_usr extends StatefulWidget {
  const list_usr({Key? key}) : super(key: key);

  @override
  _list_usr createState() => _list_usr();
}

class _list_usr extends State<list_usr> {
  var isLoading = false;
  String admin = '';
  String opcio = '';
  String rol = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Llista usuaris'),
            backgroundColor: Colors.green,
          ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  // _deleteData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   await DBProvider.db.deleteAllEmployees();

  //   // wait for 1 second to simulate loading of data
  //   await Future.delayed(const Duration(seconds: 1));

  //   setState(() {
  //     isLoading = false;
  //   });

  // // ignore: avoid_print
  // print('All employees deleted');
  // }

  _buildEmployeeListView() {
    // var lusers = dbData.users as List<Map<dynamic, dynamic>>;
      var keys = dbData.users.keys;
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black12,
            ),
            itemCount: dbData.users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                title: Text("Usuari: ${dbData.users[keys.elementAt(index)]["username"]}"),
                subtitle: Text('ADMINISTRADOR: $admin'),
              );
            },
          );
        }
      }
