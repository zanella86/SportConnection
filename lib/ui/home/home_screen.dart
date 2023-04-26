import 'package:flutter/material.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/event_type.dart';
import 'package:sport_connection/presentation/widgets/custom_message.dart';
import 'package:sport_connection/ui/profile/profile_screen.dart';
import 'package:sport_connection/presentation/widgets/bottom_bar.dart';

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
        child:  eventList.length == 0 ? CustomMessage(message: "Não encontramos eventos para exibir", child: Icon(
          Icons.mood_bad,
          size: 25,
        )) : Column(
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
                              if (event.typeEvent == EventType.RANKED) {
                                return const Icon(
                                  Icons.keyboard_double_arrow_up,
                                  size: 50,
                                );
                              } else if (event.typeEvent == EventType.LEARN) {
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
                              TextButton(onPressed: () {}, child: const Text('LIKE')),
                              const SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                  onPressed: () {}, child: const Text('DETALHES')),
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
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: BottomBar(items: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.gpp_good)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today)),
        const SizedBox(
          width: 24,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, ProfileScreen.id);
            },
            icon: const Icon(Icons.person))
      ],)
    );
  }
}
