import 'package:flutter/material.dart';
import 'package:sport_connection/domain/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/tp_event_enum.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({
    super.key,
    required this.eventList,
  });

  final List<EventEntity> eventList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Eventos populares:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final event = eventList[index];
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: () {
                              if (event.typeEvent == TpEventEnum.RANKED) {
                                return const Icon(
                                  Icons.keyboard_double_arrow_up,
                                  size: 50,
                                );
                              } else if (event.typeEvent == TpEventEnum.LEARN) {
                                return const Icon(
                                  Icons.note_alt,
                                  size: 50,
                                );
                              }
                              return const Icon(
                                Icons.beach_access,
                                size: 50,
                              );
                            }(),
                            title: Text(
                              event.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            subtitle: Text(event.description),
                            tileColor: const Color.fromRGBO(238, 237, 231, 1),
                            //trailing: Icon(Icons.more_vert),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () {}, child: Text('LIKE')),
                              SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                  onPressed: () {}, child: Text('DETALHES')),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemCount: eventList.length,
                ),
              ),
            ),
          ],
        ),
      ),
      //extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.home),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.gpp_good)),
                IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
                SizedBox(
                  width: 24,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: Icon(Icons.person))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
