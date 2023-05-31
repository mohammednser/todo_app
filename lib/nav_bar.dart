import 'package:flutter/material.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:todo_app/page/home_page.dart';
import 'package:todo_app/page/userpage.dart';

class NavigationDrawertodo extends StatelessWidget {
  const NavigationDrawertodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Drawer(
     child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListView(
            children:<Widget>[
       buildHeader(context),
       buildMenuItem(context),  
            ])   ,                             
        ],
      ),
     ),
   );
  }
 Widget buildHeader(BuildContext context) {
   Material(
     color: Colors.cyan,
     child:InkWell(
      onTap: () => {
        Navigator.pop(context),
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserPage()))
      },
     
     child: Container(
     padding: EdgeInsets.only(
      top:24+ MediaQuery.of(context).padding.top, bottom: 24,
     ), 
     child: Column(children: const [
        CircleAvatar(
          radius: 52,
          backgroundImage: NetworkImage( 'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png'),
   
        ),
        SizedBox(height: 12,),
          Text('Oflutter.com',
          style: TextStyle(color: Colors.white,fontSize: 28),
          ),
           Text('example@gmail.com',
           style: TextStyle(color: Colors.white,fontSize: 28),
           ),
     ]),
     ),
   ));
 }
  
 Widget buildMenuItem(BuildContext context) {
   Container(
    padding: EdgeInsets.all(24),
    
    child: Wrap(
      runSpacing: 16,
    children: [
     ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Home'),
              onTap: () => 
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage())),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Friends'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () => null,
            ),
            const Divider(color: Colors.black54,),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Request'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Policies'),
              onTap: () => null,
            ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => null,
            ),
    ],
    )
   );
 }
}
