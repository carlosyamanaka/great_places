// ignore_for_file: constant_identifier_names

const GOOGLE_API_KEY = 'AIzaSyC4uAjD7r_AXsms-_XP6LcA5VGSlgEJxYM';

class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude = 0,
    double longitude = 0,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
