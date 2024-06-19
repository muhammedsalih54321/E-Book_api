import 'package:e_book/Ui/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailscreen extends StatefulWidget {
  final String img;
  final String name;
  final String author;
  final String description;
  final String publisher;
  final String url;

  const Detailscreen(
      {super.key,
      required this.img,
      required this.name,
      required this.author,
      required this.description,
      required this.publisher,
      required this.url});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
              size: 30.sp,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 30.sp,
                ),
                Positioned(
                    top: 2.h,
                    left: 20.w,
                    child: CircleAvatar(
                      radius: 5.r,
                      backgroundColor: Color(0xFF8204FF),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                  size: 25.sp,
                ),
                Positioned(
                    top: -8.h,
                    left: 22.w,
                    child: CircleAvatar(
                      radius: 8.r,
                      backgroundColor: Color.fromARGB(89, 130, 4, 255),
                      child: Center(
                        child: Text('1',
                            style: GoogleFonts.roboto(
                              color: Color(0xFF8204FF),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Image.network(widget.img),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name,
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500)),
                Container(
                  height: 35.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Color.fromARGB(89, 130, 4, 255)),
                  child: Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.discount_outlined,
                          size: 18.sp,
                          color: Color(0xFF8204FF),
                        ),
                        Text('On sale',
                            style: GoogleFonts.roboto(
                                color: Color(0xFF8204FF),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                )
              ],
            ),
             SizedBox(
              height: 1.h,
            ),
             Text('\$100',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500)),
                          SizedBox(
              height: 15.h,
            ),
             Text('Description',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
                         SizedBox(
              height: 3.h,
            ),
             Text(widget.description,
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                             SizedBox(
              height: 15.h,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text('author :- ',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                             Text( widget.author,
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500)),
               ],
             ),
               SizedBox(
              height: 5.h,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text('publisher :- ',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                             Text( widget.publisher,
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500)),
               ],
             ),
             SizedBox(height: 10.h,),
              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Webscreen(Producturl: widget.url)));}, child: Text('Seemore',
              
                        style: GoogleFonts.roboto(
                          decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400))),
          ],
        ),
      ),
    );
  }
}
