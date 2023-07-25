import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendy_news/utils/colors.dart';
import 'package:trendy_news/utils/text.dart';

import 'bottomsheet.dart';
import 'components.dart';

class NewsBox extends StatelessWidget {
  final String imageurl , title , time , description, url;
  const NewsBox({
    Key?key,
    required this.imageurl, required this.title, required this.time, required this.description, required this.url,
}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            showMyBottomSheet(context, title, description, imageurl,url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5,top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                  CachedNetworkImage(imageUrl: imageurl,
                    imageBuilder: (context, imageProvider)=> Container(
                      width: 60,
                        height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow
                      ),
                    ),
                  placeholder: (context, url)=>
                    CircularProgressIndicator(color: AppColors.primary),
                    errorWidget: (context, url , error)=>Icon(Icons.error),
                  ),
                SizedBox(width: 8,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    modifiedText(text: title, size: 16, color: AppColors.white,


                    ),
                     SizedBox(height: 5,),
                    modifiedText(text: time, size: 12, color: AppColors.lightwhite),

                  ],
                ))
              ],
            ),
          ),
        ),
        DividerWidget()
      ],
    );
  }
}
