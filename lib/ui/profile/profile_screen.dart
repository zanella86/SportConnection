import 'package:flutter/material.dart';
import 'package:sport_connection/domain/entities/profile_entity.dart';
import 'package:sport_connection/ui/home/home_screen.dart';
import 'package:sport_connection/presentation/widgets/bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = '/profile_screen';

  const ProfileScreen({
    super.key,
    required this.profile,
  });

  final ProfileEntity? profile; //FIXME Utilizar o Model aqui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              _getShield(profile?.score ?? 0),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: MediaQuery.of(context).size.height * 0.15,
              child: Text(
                profile?.name.toUpperCase() ?? "",
                style: TextStyle(
                  color: _getTextColor(profile?.score ?? 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.40,
              left: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                children: [
                  Text('SCR ${profile?.score}', style: TextStyle(
                      color: _getTextColor(profile?.score ?? 0),
                      fontSize: 18,
                  ),),
                  const SizedBox(height: 8,),
                  Text('EVT ${profile?.eventsScore}', style: TextStyle(
                      color: _getTextColor(profile?.score ?? 0),
                      fontSize: 18,
                  ),),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.40,
              left: MediaQuery.of(context).size.height * 0.28,
              child: Column(
                children: [
                  Text('ACM ${profile?.achievements.length.toString().padLeft(2, '0')}', style: TextStyle(
                      color: _getTextColor(profile?.score ?? 0),
                      fontSize: 18,
                  ),),
                  const SizedBox(height: 8,),
                  Text('FRD ${ profile?.eventsScore}', style: TextStyle(
                      color: _getTextColor(profile?.score ?? 0),
                      fontSize: 18,
                  ),),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getStatus(profile?.score ?? 0),
                      style: TextStyle(
                        color: _getTextColor(profile?.score ?? 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${profile?.achievements != null ? profile?.achievements[0] : ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.person),
      ),
      bottomNavigationBar: BottomBar(
        items: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.gpp_good)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today)),
          const SizedBox(
            width: 24,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.id);
              },
              icon: const Icon(Icons.home))
        ],
      ),
    );
  }

  Color _getTextColor(int score) {
    if (score < 20) {
      return const Color.fromRGBO(235, 186, 143, 1); //brown
    }
    if (score < 70) {
      return const Color.fromRGBO(242, 242, 243, 1); //silver
    }
    return const Color.fromRGBO(255, 226, 140, 1); //gold
  }

  String _getShield(int score) {
    if (score < 20) {
      return "assets/images/cards_bg_brown.png"; //brown
    }
    if (score < 70) {
      return "assets/images/cards_bg_silver.png"; //silver
    }
    return "assets/images/cards_bg_golden.png"; //gold
  }

  String _getStatus(int score) {
    if (score < 20) {
      return "Brown Level"; //brown
    }
    if (score < 70) {
      return "Silver Level"; //silver
    }
    return "Golden Level"; //gold
  }
}
