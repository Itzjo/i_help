import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.emergencyContact,
  }) : super(key: key);

  final EmergencyContactRecord? emergencyContact;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.04, -0.22),
                child: FlutterFlowIconButton(
                  borderRadius: 100,
                  buttonSize: 150,
                  fillColor: Color(0xD4FF0000),
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: () async {
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: LatLng(0.0, 0.0));
                    // await FlutterPhoneDirectCaller.callNumber('0125262670');

                    await launchURL("tel://214324234");

                    // launchUrl(Uri(
                    //   scheme: 'tel',
                    //   path:
                    //       widget.emergencyContact!.emergencyNumber!.toString(),
                    // ));

                    final usersLocationCreateData =
                        createUsersLocationRecordData(
                      users: currentUserReference,
                      usersLocation:
                          functions.getUsersLocation(currentUserLocationValue),
                    );
                    await UsersLocationRecord.collection
                        .doc()
                        .set(usersLocationCreateData);
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.63, 0.17),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 100,
                  borderWidth: 1,
                  buttonSize: 80,
                  fillColor: Color(0xFFFF0000),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    final selectedMedia = await selectMedia(
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => isMediaUploading = true);
                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        isMediaUploading = false;
                      }
                      if (downloadUrls.length == selectedMedia.length) {
                        setState(() => uploadedFileUrl = downloadUrls.first);
                        showUploadMessage(context, 'Success!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Failed to upload media');
                        return;
                      }
                    }
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.7, 0.06),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('ContacList');
                  },
                  text: 'Edit',
                  options: FFButtonOptions(
                    width: 100,
                    height: 30,
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                    elevation: 20,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.96, 0.34),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 400, 50, 90),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0x33000000),
                          offset: Offset(0, 5),
                        )
                      ],
                      borderRadius: BorderRadius.circular(200),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Feel Unsafe ?\nUse ME',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0x8A000000),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.89),
                child: Text(
                  'iHELP',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Source Sans Pro',
                        color: Color(0xFFFF0004),
                        fontSize: 50,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
