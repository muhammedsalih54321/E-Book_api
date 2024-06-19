import 'package:e_book/Bloc/Book/book_bloc.dart';
import 'package:e_book/Repository/Model/book_model.dart';
import 'package:e_book/Ui/Screens/Detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late List<Bookmodel> book;
  @override
  void initState() {
    BlocProvider.of<BookBloc>(context).add(FetchbookEvent());
    super.initState();
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            AppBar(
              title: Text('Wizo',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  )),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 35.sp,
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
                  padding: const EdgeInsets.only(right: 9),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: 30.sp,
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
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: const Color.fromARGB(34, 0, 0, 0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Featured products',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF414141),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Text('See all',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF8204FF),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is Bookblocloading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (State is Bookblocerror) {
                    return RefreshIndicator(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .9,
                          // color: Colors.red,
                          child: const Center(
                              child: Text('Oops something went wrong')),
                        ),
                      ),
                      onRefresh: () async {
                        return BlocProvider.of<BookBloc>(context)
                            .add(FetchbookEvent());
                      },
                    );
                  }
                  if (state is Bookblocloaded) {
                    book = BlocProvider.of<BookBloc>(context).bookmodel;
                    return GridView.builder(
                        itemCount: book.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 310 / 400,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 3),
                        itemBuilder: (context, index) {
                          return Card(
                            shadowColor: Colors.black,
                            elevation: 2,
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Detailscreen(
                                            img: book[index]
                                                .bookImage
                                                .toString(),
                                            name: book[index]
                                                .bookTitle
                                                .toString(),
                                            author: book[index]
                                                .bookAuthor
                                                .toString(),
                                            description: book[index]
                                                .bookDescription
                                                .toString(),
                                            publisher: book[index]
                                                .bookPublisher
                                                .toString(),
                                            url: book[index]
                                                .amazonBookUrl
                                                .toString(),
                                          ))),
                              child: Container(
                                width: 170.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Container(
                                          height: 140.h,
                                          width: double.infinity,
                                          child: Image.network(book[index]
                                              .bookImage
                                              .toString())),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                            height: 20.h,
                                            width: 140.w,
                                            child: Text(
                                              book[index].bookTitle.toString(),
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$100',
                                            style: GoogleFonts.roboto(
                                              color: Color(0xFF8204FF),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Icon(
                                            Icons.add_shopping_cart_outlined,
                                            color: Color(0xFF8204FF),
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
