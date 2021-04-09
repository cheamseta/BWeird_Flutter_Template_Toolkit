import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class TicketQRScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TicketQRScanState();
  }
}

class _TicketQRScanState extends State<TicketQRScan>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isFlash = false, isPause = false;
  AnimationController animationController;
  QRViewController controller;
  Animation<double> verticalPosition;



  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animationController.addListener(() {
      this.setState(() {});
    });
    animationController.forward();
    verticalPosition = Tween<double>(begin: 5.0, end: 240.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        } else if (state == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    super.initState();

 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isPause ? pauseView() : scannerView());
  }

  Widget pauseView() {
    return Column(
      children: [
        closeWidget(Colors.black),
        Center(
            child: TextButton(
          child: Text("SCAN AGAIN"),
          onPressed: () {
            setState(() {
              isPause = false;
              controller.resumeCamera();
            });
          },
        )),
      ],
    );
  }

  Widget scannerView() {
    return Stack(
      children: <Widget>[
        QRView(
          key: qrKey,
          onQRViewCreated: (r) => _onQRViewCreated(r, context),
        ),
        Center(
          heightFactor: 2,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                height: 250,
                width: 250,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.fromBorderSide(
                          BorderSide(width: 1.4, color: Colors.white70))),
                ),
              ),
              Positioned(
                top: verticalPosition.value,
                child: Container(
                  width: 240,
                  height: 3.0,
                  decoration: BoxDecoration(color: Colors.white24, boxShadow: [
                    BoxShadow(
                        blurRadius: 3.0,
                        color: Colors.redAccent,
                        spreadRadius: 3.0)
                  ]),
                ),
              )
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton.icon(
                icon: !_isFlash
                    ? Icon(
                        Icons.flash_off,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.flash_on,
                        color: Colors.white,
                      ),
                onPressed: () {
                  if (!_isFlash)
                    setState(() {
                      _isFlash = true;
                      controller.toggleFlash();
                    });
                  else
                    setState(() {
                      _isFlash = false;
                      controller.toggleFlash();
                    });
                },
                label: Text(''),
              )
            ],
          ),
        ),
        closeWidget(Colors.white)
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      // routeToDetail(scanData);
      setState(() {
        isPause = true;
      });
    });
  }


  Widget closeWidget(Color color) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40, right: 40),
              child: Icon(Icons.close, color: color))),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    animationController?.dispose();
    super.dispose();
  }
}
