
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import "../client.dart";
import '../enums.dart';
import "../service.dart";

class Avatars extends Service {
     
    Avatars(Client client): super(client);

     /// You can use this endpoint to show different browser icons to your users.
     /// The code argument receives the browser code as it appears in your user
     /// /account/sessions endpoint. Use width, height and quality arguments to
     /// change the output settings.
    Future<Response> getBrowser({@required String code, int width = 100, int height = 100, int quality = 100}) {
        final String path = '/avatars/browsers/{code}'.replaceAll(RegExp('{code}'), code);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Need to display your users with your billing method or their payment
     /// methods? The credit card endpoint will return you the icon of the credit
     /// card provider you need. Use width, height and quality arguments to change
     /// the output settings.
    Future<Response> getCreditCard({@required String code, int width = 100, int height = 100, int quality = 100}) {
        final String path = '/avatars/credit-cards/{code}'.replaceAll(RegExp('{code}'), code);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Use this endpoint to fetch the favorite icon (AKA favicon) of a  any remote
     /// website URL.
    Future<Response> getFavicon({@required String url}) {
        final String path = '/avatars/favicon';

        final Map<String, dynamic> params = {
            'url': url,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// You can use this endpoint to show different country flags icons to your
     /// users. The code argument receives the 2 letter country code. Use width,
     /// height and quality arguments to change the output settings.
    Future<Response> getFlag({@required String code, int width = 100, int height = 100, int quality = 100}) {
        final String path = '/avatars/flags/{code}'.replaceAll(RegExp('{code}'), code);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Use this endpoint to fetch a remote image URL and crop it to any image size
     /// you want. This endpoint is very useful if you need to crop and display
     /// remote images in your app or in case you want to make sure a 3rd party
     /// image is properly served using a TLS protocol.
    Future<Response> getImage({@required String url, int width = 400, int height = 400}) {
        final String path = '/avatars/image';

        final Map<String, dynamic> params = {
            'url': url,
            'width': width,
            'height': height,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Converts a given plain text to a QR code image. You can use the query
     /// parameters to change the size and style of the resulting image.
    Future<Response> getQR({@required String text, int size = 400, int margin = 1, int download = null}) {
        final String path = '/avatars/qr';

        final Map<String, dynamic> params = {
            'text': text,
            'size': size,
            'margin': margin,
            'download': download,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
}