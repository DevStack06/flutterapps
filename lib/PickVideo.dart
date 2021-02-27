import 'package:flutter/material.dart';
import 'package:flutterapps/VideoPlayerFIle.dart';
import 'package:image_picker/image_picker.dart';

class PickVideo extends StatefulWidget {
  PickVideo({Key key}) : super(key: key);

  @override
  _PickVideoState createState() => _PickVideoState();
}

class _PickVideoState extends State<PickVideo> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        onPressed: () async {
          PickedFile _imageFile;
          _imageFile = await _picker.getVideo(source: ImageSource.gallery);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => VideoPlayerFileCustum(
                        path: _imageFile.path,
                      )));
        },
        child: Text("Upload"),
        color: Colors.blue,
      )),
    );
  }
}
