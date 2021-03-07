class Constants {

  static const APP_NAME = '🐶반려동물찾기🐱';

  static const SERVICE_KEY = 'ecDioYEZprWJjrG6cXDtsryzdG3AZDGB8xKFxDfhR8TMHV1%2F5VqqndjAjUQQVFTxxxxxxxxxxxxxxxx';

  static String changeSex(String sex) {
    return sex == 'M' ? '암컷' : '수컷';
  }

  static String appendDate(String date) {
    if(date.isEmpty) return "";
    return '${date.substring(0,4)}.${date.substring(4,6)}.${date.substring(6, date.length)}';
  }

  static String nonNullString(String data) {
    return data == null ? "" : data;
  }


  //route
  static const FIND_DETAIL = '/detail';
  static const FIND_DETAIL_PHOTO = '/detail_photo';
}