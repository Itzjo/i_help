import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ContacListWidget extends StatefulWidget {
  const ContacListWidget({
    Key? key,
    this.emergencyContact,
  }) : super(key: key);

  final EmergencyContactRecord? emergencyContact;

  @override
  _ContacListWidgetState createState() => _ContacListWidgetState();
}

class _ContacListWidgetState extends State<ContacListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xE6FF0005),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 32,
          ),
        ),
        title: Text(
          'Emergency Contact List',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              child: StreamBuilder<List<EmergencyContactRecord>>(
                stream: queryEmergencyContactRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<EmergencyContactRecord>
                      columnEmergencyContactRecordList = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(columnEmergencyContactRecordList.length,
                              (columnIndex) {
                        final columnEmergencyContactRecord =
                            columnEmergencyContactRecordList[columnIndex];
                        return ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                              child: Slidable(
                                actionPane: const SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Remove',
                                    color: Color(0xFFE00707),
                                    icon: Icons.delete,
                                    onTap: () async {
                                      await columnEmergencyContactRecord
                                          .reference
                                          .delete(); //list tile function
                                    },
                                  ),
                                ],
                                child: ListTile(
                                  title: Text(
                                    columnEmergencyContactRecord.contactName!,
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                        ),
                                  ),
                                  tileColor:
                                      FlutterFlowTheme.of(context).gray200,
                                  dense: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  fillColor: Color(0xC2FF0000),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    context.pushNamed('AddContact');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
