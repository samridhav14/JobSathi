import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/models/response/jobs/jobs_response.dart';
import 'package:job_sathi/services/helpers/jobs_helper.dart';
import 'package:job_sathi/views/common/exports.dart';
import 'package:job_sathi/views/common/loader.dart';
import 'package:job_sathi/views/common/vertical_tile.dart';
import 'package:job_sathi/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
       iconTheme: IconThemeData(color:Color(kLight.value),),
       title:CustomField(
        hintText: 'Search For a Job', 
        controller: search,
         suffixIcon:GestureDetector(
           onTap: (){
            setState(() {
              
            });
           },
           child: const Icon(AntDesign.search1),
         ),
       ),
      elevation: 0,
      ),
      body: search.text.isNotEmpty?Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<JobsResponse>>(
          future: JobsHelper.searchJobs(search.text),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return Center(child: ReusableText(text: "Error: ${snapshot.error}", style: appstyle(16, Color(kDark.value), FontWeight.w600),),);
            }
            else if(snapshot.data!.isEmpty){
              return const Loader();
            }
            final jobs = snapshot.data;
             return ListView.builder(
              itemCount: jobs!.length,
              itemBuilder: (context,index){
                final job = jobs[index];
                return VerticalTileWidget(jobs: job, onTap: (){});
              }
             );
          },),
      ) 
        :Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h,
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/optimized_search.png"),
              ReusableText(text: "Start Searching For Jobs", style: appstyle(24, Color(kDark.value), FontWeight.w600),),
               ],
          )
        ),
    );
  }
}