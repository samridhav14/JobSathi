import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
       iconTheme: IconThemeData(color:Color(kLight.value),),
       title:CustomField(
        hintText: 'Search For a Job', 
        controller: controller,
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
      body:  Center(
          child:
            Padding(padding: EdgeInsets.all(20.h),
            child:Image.asset('assets/images/optimized_search.png',height: 200.h,width: 200.h,),
        
            )
  
        )
    );
  }
}