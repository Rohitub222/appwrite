
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import "../client.dart";
import '../enums.dart';
import "../service.dart";

class Storage extends Service {
     
    Storage(Client client): super(client);

     /// Get a list of all the user files. You can use the query params to filter
     /// your results. On admin mode, this endpoint will return a list of all of the
     /// project files. [Learn more about different API modes](/docs/admin).
    Future<Response> listFiles({String search = null, int limit = 25, int offset = null, OrderType orderType = OrderType.asc}) {
        final String path = '/storage/files';

        final Map<String, dynamic> params = {
            'search': search,
            'limit': limit,
            'offset': offset,
            'orderType': orderType.name(),
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Create a new file. The user who creates the file will automatically be
     /// assigned to read and write access unless he has passed custom values for
     /// read and write arguments.
    Future<Response> createFile({@required  file, @required List read, @required List write}) {
        final String path = '/storage/files';

        final Map<String, dynamic> params = {
            'file': file,
            'read': read,
            'write': write,
        };

        return this.client.call(HttpMethod.post, path: path, params: params);
    }
     /// Get file by its unique ID. This endpoint response returns a JSON object
     /// with the file metadata.
    Future<Response> getFile({@required String fileId}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Update file by its unique ID. Only users with write permissions have access
     /// to update this resource.
    Future<Response> updateFile({@required String fileId, @required List read, @required List write}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'read': read,
            'write': write,
        };

        return this.client.call(HttpMethod.put, path: path, params: params);
    }
     /// Delete a file by its unique ID. Only users with write permissions have
     /// access to delete this resource.
    Future<Response> deleteFile({@required String fileId}) {
        final String path = '/storage/files/{fileId}'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        return this.client.call(HttpMethod.delete, path: path, params: params);
    }
     /// Get file content by its unique ID. The endpoint response return with a
     /// 'Content-Disposition: attachment' header that tells the browser to start
     /// downloading the file to user downloads directory.
    Future<Response> getFileDownload({@required String fileId}) {
        final String path = '/storage/files/{fileId}/download'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Get a file preview image. Currently, this method supports preview for image
     /// files (jpg, png, and gif), other supported formats, like pdf, docs, slides,
     /// and spreadsheets, will return the file icon image. You can also pass query
     /// string arguments for cutting and resizing your preview image.
    Future<Response> getFilePreview({@required String fileId, int width = null, int height = null, int quality = 100, String background = null, String output = null}) {
        final String path = '/storage/files/{fileId}/preview'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'width': width,
            'height': height,
            'quality': quality,
            'background': background,
            'output': output,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
     /// Get file content by its unique ID. This endpoint is similar to the download
     /// method but returns with no  'Content-Disposition: attachment' header.
    Future<Response> getFileView({@required String fileId, String as = null}) {
        final String path = '/storage/files/{fileId}/view'.replaceAll(RegExp('{fileId}'), fileId);

        final Map<String, dynamic> params = {
            'as': as,
        };

        return this.client.call(HttpMethod.get, path: path, params: params);
    }
}