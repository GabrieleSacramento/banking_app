import 'package:banking_app/pages/my_credit_card_page.dart';
import 'package:banking_app/pages/my_profile_page.dart';
import 'package:banking_app/widgets/blocked_widget.dart';
import 'package:flutter/material.dart';

class BankingAppHomePage extends StatefulWidget {
  const BankingAppHomePage({super.key});

  @override
  State<BankingAppHomePage> createState() => _BankingAppHomePageState();
}

class _BankingAppHomePageState extends State<BankingAppHomePage>
    with WidgetsBindingObserver {
  bool isAppInactive = false;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state != AppLifecycleState.resumed) {
        isAppInactive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 24, bottom: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Total available amount',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(64, 99, 93, 1),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'R\$ 15,350.60',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(64, 99, 93, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Color.fromRGBO(64, 99, 93, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MyCreditCardPage(),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.42),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const ListTile(
                                leading: Icon(
                                  Icons.credit_card,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'See my credit card',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MyProfilePage(),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.42),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'See my profile',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isAppInactive)
            BlockedWidget(
              onTap: () => setState(() => isAppInactive = false),
            ),
        ],
      ),
    );
  }
}
