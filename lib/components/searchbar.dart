import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendy_news/backend/functions.dart';
import 'package:trendy_news/utils/colors.dart';

class SearchBar1 extends StatefulWidget {
  const SearchBar1({super.key});
  static TextEditingController searchcontroller = TextEditingController(text: '');
  @override
  State<SearchBar1> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          height: 50,
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.darkgrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  controller: SearchBar1.searchcontroller,
                decoration: InputDecoration(
                  hintText: 'Search a keyword or a phrase',
                  hintStyle: GoogleFonts.lato(),
                  border: InputBorder.none
                ),))
              ],
            ),
          ),
        )),
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            fetchnews();

          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.darkgrey, shape: BoxShape.circle
            ),
            child: Icon(Icons.search,
            color: AppColors.white,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}
