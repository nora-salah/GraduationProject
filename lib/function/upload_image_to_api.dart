import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}



Future<XFile?> pickImage(ImageSource source)async{
  XFile? image= await ImagePicker().pickImage(source: source);
  if(image!=null){
    return image;
  }
  else{
    return null;
  }
}