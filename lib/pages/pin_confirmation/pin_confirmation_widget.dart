import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pin_confirmation_model.dart';
export 'pin_confirmation_model.dart';

class PinConfirmationWidget extends StatefulWidget {
  const PinConfirmationWidget({
    super.key,
    required this.mobileNumber,
  });

  final String? mobileNumber;

  @override
  State<PinConfirmationWidget> createState() => _PinConfirmationWidgetState();
}

class _PinConfirmationWidgetState extends State<PinConfirmationWidget>
    with TickerProviderStateMixin {
  late PinConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinConfirmationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PinConfirmation'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PIN_CONFIRMATION_PinConfirmation_ON_INIT');
      logFirebaseEvent('PinConfirmation_timer');
      _model.timerController.onStartTimer();
    });

    authManager.handlePhoneAuthStateChanges(context);
    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verificação de segurança',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'Digite o código enviado para ${widget!.mobileNumber}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x33FFFFFF),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFFD0CFCF),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 48.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 6,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          enableActiveFill: false,
                          autoFocus: true,
                          enablePinAutofill: true,
                          errorTextSpace: 16.0,
                          showCursor: true,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          obscureText: false,
                          hintCharacter: '-',
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 36.0,
                            fieldWidth: 36.0,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            shape: PinCodeFieldShape.box,
                            activeColor: Colors.black,
                            inactiveColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            selectedColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            activeFillColor: Colors.black,
                            inactiveFillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          controller: _model.pinCodeController,
                          onChanged: (_) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.black,
                                size: 16.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowTimer(
                                    initialTime: _model.timerInitialTimeMs,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                    controller: _model.timerController,
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) setState(() {});
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PIN_CONFIRMATION_Text_tfa8k0s6_ON_TAP');
                                  logFirebaseEvent('Text_navigate_to');
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed('Authentication');
                                },
                                child: Text(
                                  'Número errado?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (_model.timerMilliseconds == 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Não recebeu o código?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PIN_CONFIRMATION_Icon_62jyfru5_ON_TAP');
                                logFirebaseEvent('Icon_timer');
                                _model.timerController.timer
                                    .setPresetTime(mSec: 30000, add: false);
                                _model.timerController.onResetTimer();

                                logFirebaseEvent('Icon_timer');
                                _model.timerController.onStartTimer();
                                logFirebaseEvent('Icon_auth');
                                final phoneNumberVal = widget!.mobileNumber;
                                if (phoneNumberVal == null ||
                                    phoneNumberVal.isEmpty ||
                                    !phoneNumberVal.startsWith('+')) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Phone Number is required and has to start with +.'),
                                    ),
                                  );
                                  return;
                                }
                                await authManager.beginPhoneAuth(
                                  context: context,
                                  phoneNumber: phoneNumberVal,
                                  onCodeSent: (context) async {
                                    context.goNamedAuth(
                                      'PinConfirmation',
                                      context.mounted,
                                      queryParameters: {
                                        'mobileNumber': serializeParam(
                                          widget!.mobileNumber,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      ignoreRedirect: true,
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.refresh_outlined,
                                color: Colors.black,
                                size: 16.0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PIN_CONFIRMATION_Text_011765ct_ON_TAP');
                                    logFirebaseEvent('Text_timer');
                                    _model.timerController.timer
                                        .setPresetTime(mSec: 30000, add: false);
                                    _model.timerController.onResetTimer();

                                    logFirebaseEvent('Text_timer');
                                    _model.timerController.onStartTimer();
                                    logFirebaseEvent('Text_auth');
                                    final phoneNumberVal = widget!.mobileNumber;
                                    if (phoneNumberVal == null ||
                                        phoneNumberVal.isEmpty ||
                                        !phoneNumberVal.startsWith('+')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Phone Number is required and has to start with +.'),
                                        ),
                                      );
                                      return;
                                    }
                                    await authManager.beginPhoneAuth(
                                      context: context,
                                      phoneNumber: phoneNumberVal,
                                      onCodeSent: (context) async {
                                        context.goNamedAuth(
                                          'PinConfirmation',
                                          context.mounted,
                                          queryParameters: {
                                            'mobileNumber': serializeParam(
                                              widget!.mobileNumber,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          ignoreRedirect: true,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Reenviar',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: (_model.pinCodeController!.text == null ||
                          _model.pinCodeController!.text == '')
                      ? null
                      : () async {
                          logFirebaseEvent(
                              'PIN_CONFIRMATION_VALIDAR_CDIGO_BTN_ON_TA');
                          logFirebaseEvent('Button_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final smsCodeVal = _model.pinCodeController!.text;
                          if (smsCodeVal == null || smsCodeVal.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Enter SMS verification code.'),
                              ),
                            );
                            return;
                          }
                          final phoneVerifiedUser =
                              await authManager.verifySmsCode(
                            context: context,
                            smsCode: smsCodeVal,
                          );
                          if (phoneVerifiedUser == null) {
                            return;
                          }

                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamedAuth(
                              'CreateAccount', context.mounted);
                        },
                  text: 'Validar Código',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 55.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryText,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
