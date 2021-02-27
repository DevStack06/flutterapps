import 'package:flutter/material.dart';
import 'package:flutterapps/VideoPlayerFIle.dart';
import 'package:image_picker/image_picker.dart';

class PickFile extends StatefulWidget {
  PickFile({Key key}) : super(key: key);

  @override
  _PickFileState createState() => _PickFileState();
}

class _PickFileState extends State<PickFile> {
  PickedFile _pickedFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            _pickedFile = await picker.getVideo(source: ImageSource.gallery);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => VideoPlayerFileCustum(
                          videopath: _pickedFile.path,
                        )));
          },
          child: Text("Upload video"),
        ),
      ),
    );
  }
}
