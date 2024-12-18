import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class BottomBar extends StatefulWidget {
  final Function(int) onTap;
  const BottomBar({super.key, required this.onTap});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  // int _index = -1;
  final List<BottomBarItem> _widgetOptions = <BottomBarItem>[
    BottomBarItem(text: 'Dashboard', icon: FontAwesomeIcons.home
        // style: optionStyle,
        ),
    BottomBarItem(text: 'Laporan', icon: FontAwesomeIcons.fileLines
        // style: optionStyle,
        ),
    BottomBarItem(text: 'Pengaturan', icon: FontAwesomeIcons.gear
        // style: optionStyle,
        ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onTap(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.transparent,
      height: 68,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 29,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: fullWidth * 0.8,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ..._widgetOptions.map((item) {
                      final index = _widgetOptions.indexOf(item);
                      return IconButton(
                          onPressed: () => _onItemTapped(index),
                          icon: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                item.icon,
                                color: index == _selectedIndex
                                    ? CustomColorTheme.colorPrimary
                                    : Colors.grey,
                              ),
                              Text(item.text,
                                  style: CustomTextTheme
                                      .proofMasterTextTheme.labelSmall
                                      ?.copyWith(
                                    color: index == _selectedIndex
                                        ? CustomColorTheme.colorPrimary
                                        : Colors.grey,
                                  ))
                            ],
                          ));
                    })
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class BottomBarItem {
  final String text;
  final IconData icon;
  BottomBarItem({required this.text, required this.icon});
}
