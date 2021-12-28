import 'package:contacts_app/contact_details_view.dart';
import 'package:contacts_app/contact_model.dart';
import "package:flutter/material.dart";
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Naida Christensen",
      "phone": "622-8777",
      "country": "Brazil",
      "email": "magna.nec@outlook.net",
      "region": "Adana"
    },
    {
      "name": "May Farmer",
      "phone": "1-768-873-1807",
      "country": "Brazil",
      "email": "nec.tempus@outlook.ca",
      "region": "Santa Catarina"
    },
    {
      "name": "Maggie Graves",
      "phone": "688-2723",
      "country": "Mexico",
      "email": "non.lacinia@yahoo.net",
      "region": "Corse"
    },
    {
      "name": "Ryan Cole",
      "phone": "1-376-369-8588",
      "country": "Brazil",
      "email": "ultrices.sit.amet@yahoo.ca",
      "region": "Minnesota"
    },
    {
      "name": "Stewart Rivas",
      "phone": "798-3697",
      "country": "Nigeria",
      "email": "nec.tempus@icloud.org",
      "region": "Sindh"
    },
    {
      "name": "Cooper Osborne",
      "phone": "488-2351",
      "country": "Poland",
      "email": "tincidunt.neque.vitae@google.com",
      "region": "Zeeland"
    },
    {
      "name": "Omar Wallace",
      "phone": "142-4958",
      "country": "Vietnam",
      "email": "ante.lectus@hotmail.org",
      "region": "Araucanía"
    },
    {
      "name": "Kelly Bentley",
      "phone": "1-261-888-8704",
      "country": "Costa Rica",
      "email": "est@outlook.couk",
      "region": "Dalarnas län"
    },
    {
      "name": "Armando Daniels",
      "phone": "938-2203",
      "country": "Poland",
      "email": "metus.aliquam.erat@protonmail.couk",
      "region": "Drenthe"
    },
    {
      "name": "Howard Dejesus",
      "phone": "111-3011",
      "country": "Netherlands",
      "email": "egestas@icloud.com",
      "region": "Kirkcudbrightshire"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Contacts',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/avatar.webp'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Search by name or number',
                    prefixIcon: const Icon(Icons.search)),
              ),
            )),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recents',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap:  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
          return ContactDetailsView( contact: Contact(country: 'Ghana', email: 'martinklutsey@gmail.com', name: 'Martin EK', phone: '+233 248 309 397', region: 'Greater Accra'));
        }));
                  },
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/avatar2.webp'),
                    backgroundColor: Color(0xff00af9a),
                  ),
                  title: const Text(
                    'Martin EK',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('+233 24 830 9397'),
                  trailing:
                      const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 25,
                  thickness: 2,
                );
              },
              itemCount: 3,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Contacts',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(contact: contact,);
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/avatar2.webp'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },

              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff1A4ADA),
          onPressed: () {},
          child: const Icon(Icons.add)),
    );
  }
}
