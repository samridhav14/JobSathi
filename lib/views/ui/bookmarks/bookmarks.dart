import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/controllers/bookmark_provider.dart';
import 'package:job_sathi/models/response/bookmarks/all_bookmarks.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/drawer/drawer_widget.dart';
import 'package:job_sathi/views/ui/bookmarks/widgets/bookmark_widget.dart';
import 'package:provider/provider.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "BookMarks",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: Consumer<BookMarkNotifier>(
        builder: (context, bookMarkNotifier, child) {
          bookMarkNotifier.getBookMarks();
          return FutureBuilder<List<AllBookmark>>(
              future: bookMarkNotifier.bookmarks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final bookmark = snapshot.data;
                  if(snapshot.data!.isEmpty){
                    return const Center(child: Text("No Bookmarks"),);
                  }
                  return ListView.builder(
                      itemCount: bookmark!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final bookmarks = bookmark[index];
                        return BookMarkTileWidget(job: bookmarks);
                      });
                }
              });
        },
      ),
    );
  }
}


