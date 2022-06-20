
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medico/pages/custompages/facetracker/face_detector_view.dart';

class SmileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google ML Kit Demo App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ExpansionTile(
                    title: const Text('Vision APIs'),
                    children: [
                      // CustomCard('Barcode Scanning', BarcodeScannerView()),
                      CustomCard('Face Detection', FaceDetectorView()),
                      // CustomCard('Image Labeling', ImageLabelView()),
                      // CustomCard('Object Detection', ObjectDetectorView()),
                      // CustomCard('Text Recognition', TextRecognizerView()),
                      // CustomCard('Digital Ink Recognition', DigitalInkView()),
                      // CustomCard('Pose Detection', PoseDetectorView()),
                      // CustomCard('Selfie Segmentation', SelfieSegmenterView()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ExpansionTile(
                  //   title: const Text('Natural Language APIs'),
                  //   children: [
                  //     CustomCard('Language ID', LanguageIdentifierView()),
                  //     CustomCard(
                  //         'On-device Translation', LanguageTranslatorView()),
                  //     CustomCard('Smart Reply', SmartReplyView()),
                  //     CustomCard('Entity Extraction', EntityExtractionView()),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage, {this.featureCompleted = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                const Text('This feature has not been implemented yet')));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
          }
        },
      ),
    );
  }
}