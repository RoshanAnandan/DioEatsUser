// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:user/Dashboard/Profile/profilee.dart';
//
// class QrPage extends StatelessWidget {
//   const QrPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(backgroundColor: Colors.red[200],
//         body: SafeArea(
//           child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(children: [
//                 IconButton(
//                   alignment: Alignment.topLeft,
//                   icon: const Icon(
//                     Icons.keyboard_arrow_left_outlined,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => const ProfilePage()));
//                   },
//                 ),
//                 const Text(
//                   " QR CODE",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//               ]),
//               const SizedBox(height:10,),
//               IconButton(
//                 alignment: Alignment.topLeft,
//                 icon: Icon(
//                   Icons.person_outlined,
//                   color: Colors.red[900],
//                   size: 40,
//                 ),
//                 onPressed: () {
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(
//                   //         builder: (_) =>
//                   //         const HomeTabPage()));
//                 },
//               ),
//               const SizedBox(height: 15,width:40),
//               const Text(
//                 'Name',
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               const SizedBox(height: 15,width:40),
//               const Text(
//                 'Delivery ID',
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//       SizedBox(
//           height: 250,
//           child: Container(
//             height: 400,
//             width: 400,
//             margin: const EdgeInsets.all(15.0),
//             padding: const EdgeInsets.all(3.0),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/QRCode.jpg'),
//               ),
//             ),
//             child: const SizedBox(height: 400),
//           ),),
//               const SizedBox(height: 20), const Text(
//                 'Scan this QRCode To Pay',
//                 style: TextStyle( color: Colors.black),
//               ),
//               const SizedBox(width: 50),
//             ],
//           ),
//         ),
//
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:upi_india/upi_app.dart';
import 'package:upi_india/upi_exception.dart';
import 'package:upi_india/upi_india.dart';
import 'package:upi_india/upi_response.dart';

import 'OrderList/orderpage.dart';
class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "EFGH",
      receiverName: 'ABCD',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
                body,
                style: value,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading:  IconButton(
          alignment: Alignment.topLeft,
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => OrderHistory()));
          },
        ),
        title: const Text(
          "PAYMENTS PAGE",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height:100),
           const Text(
            "Pay your Food By Using the Following App",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          SizedBox(height:70),
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                        style: header,
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;
                  // Data in UpiResponse can be null. Check before printing
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String resCode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                  _checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTransactionData('Transaction Id', txnId),
                        displayTransactionData('Response Code', resCode),
                        displayTransactionData('Reference Id', txnRef),
                        displayTransactionData('Status', status.toUpperCase()),
                        displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}