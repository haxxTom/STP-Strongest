import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'database/exercisesList.dart';
import 'database/database.dart';
import 'templates.dart';

class TemplateWorkoutScreen extends StatefulWidget {
  @override
  _TemplateWorkoutScreenState createState() => _TemplateWorkoutScreenState();
}

class _TemplateWorkoutScreenState extends State<TemplateWorkoutScreen> {
  List<Map<String, dynamic>> _templates = [];
  TextEditingController _titleController = TextEditingController();
  List<Cvik> _exercises = [];

  @override
  void initState() {
    super.initState();
    _loadTemplates();
  }

  Future<void> _loadTemplates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? templatesJson = prefs.getString('workout_templates');
    if (templatesJson != null) {
      setState(() {
        _templates = List<Map<String, dynamic>>.from(jsonDecode(templatesJson));
      });
    }
  }

  Future<void> _saveTemplate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> template = {
      'name': _titleController.text,
      'exercises': _exercises.map((e) => e.toJson()).toList(),
    };
    _templates.add(template);
    await prefs.setString('workout_templates', jsonEncode(_templates));
    setState(() {});
  }

  void _deleteTemplate(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _templates.removeAt(index);
    });
    await prefs.setString('workout_templates', jsonEncode(_templates));
  }

  void _addExercise(Cvik cvik) {
    setState(() {
      _exercises.add(cvik);
    });
  }

  void _showExerciseSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Vyberte cvik"),
          content: Container(
            height: 300,
            child: ListView.builder(
              itemCount: scviky.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(scviky[index].nazev),
                  onTap: () {
                    _addExercise(scviky[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Šablony tréninků"), backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Název tréninku",
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _exercises.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[850],
                  child: ListTile(
                    title: Text(_exercises[index].nazev, style: TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _exercises.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _showExerciseSelectionDialog,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text("Přidat cvik", style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _saveTemplate,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text("Uložit jako šablonu", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}