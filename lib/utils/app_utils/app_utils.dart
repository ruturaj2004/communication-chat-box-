import '../../constants/app_enum.dart';
import '../../constants/app_images.dart';

String fetchIconFromAsset(assetName) {
  if (assetName == AppIcons.logo.name) {
    return AppImages.logo;
  }else if (assetName == AppIcons.message.name){
    return AppImages.message;
  }else if(assetName == AppIcons.send.name){
    return AppImages.send;
  }else if(assetName == AppIcons.backArrow.name){
    return AppImages.backArrow;
  }else if(assetName == AppIcons.search.name){
    return AppImages.search;
  }

  return '';
}
