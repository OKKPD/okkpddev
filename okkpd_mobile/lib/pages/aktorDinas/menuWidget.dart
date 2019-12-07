import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okkpd_mobile/constants/key.dart';
import 'package:okkpd_mobile/model/MenuModel.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Container(padding: EdgeInsets.only(left: 16,top: 16), child: Text("Menu", style: Keys().normalFontSize, ),),
      GridView.count(
      shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        padding: EdgeInsets.only(
            left: 12, top: 16, right: 12, bottom: 12),
        crossAxisCount: 2,
        children: List.generate(Keys.menuManagerAdmin.length, (index) {
          return Center(
            child: menuWidget(Keys.menuManagerAdmin[index]),
          );
        }),
      ),
    ],);
  }

  Widget menuWidget(MenuModel menu) {
    return Card(
        color: Colors.white,
        child: new InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(menu.route);
            },
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Image(image: menu.icon, width: 56,),
                    SizedBox(height: 16,),
                    Center(
                      child: Text(
                        menu.namaMenu,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
            )));
  }

}
