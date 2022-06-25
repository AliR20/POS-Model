import 'dart:typed_data';

import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_model/screens/login/services/firebase_services.dart';
import 'package:pos_model/screens/transactions/utils/const.dart';
import 'package:pos_model/screens/transactions/widgets/alert_drop_down.dart';
import 'package:pos_model/screens/transactions/widgets/alert_text_field.dart';
import 'package:pos_model/utils/date_formatter.dart';

class AddCustomersPopUp extends StatefulWidget {
  AddCustomersPopUp({Key? key}) : super(key: key);

  @override
  State<AddCustomersPopUp> createState() => _AddCustomersPopUpState();
}

class _AddCustomersPopUpState extends State<AddCustomersPopUp> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final TextEditingController balanceController = TextEditingController();

  final TextEditingController creditController = TextEditingController();

  final TextEditingController discountController = TextEditingController();

  final TextEditingController bioController = TextEditingController();
  final TextEditingController shippingAddressController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String customerType = '';
  String payment = '';

  List<String> customerTypeList = [
    'Individual',
    'Business',
  ];

  List<String> paymentMethods = [
    'Cash',
    'Credit',
    'Partial',
  ];
  String? location;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> getLocation(Position position) async {
    var addresses = await GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude);
    var first = addresses.first;
    setState(() {
      location = '${first.country} ${first.street}';
    });
    return location!;
  }

  Uint8List? images;
  Uint8List? webImage;
  Future<Uint8List> getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final imagePicked =
        await imagePicker.pickImage(source: ImageSource.gallery);
    final imageFile = await imagePicked!.readAsBytes();
    setState(() {
      images = imageFile;
    });
    return images!;
  }

  Future getWebFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List file = result.files.single.bytes!;
      setState(() {
        webImage = file;
      });
    } else {
      // User canceled the picker
    }
  }

  String? date;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: FittedBox(
        fit: BoxFit.fitHeight,
        child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Add New Customer',
                    style: Theme.of(context).textTheme.headline1),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Name',
                    controller: nameController,
                    isCustomer: true,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await getWebFile();
                    await FirebaseMethods.storeWebImage(webImage!, 'Customers');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    height: 55,
                    width: double.infinity,
                    child: webImage == null
                        ? Text('Select an Image')
                        : Image.memory(webImage!),
                  ),
                ),
                AlertDropDown(
                    items: customerTypeList,
                    labelText: 'Type',
                    hintText: 'Individual/Business',
                    onTap: (value) {
                      setState(() {
                        customerType = value.toString();
                      });
                    },
                    value: 'Individual'),

                InkWell(
                  onTap: () async {
                    Position position = await _getGeoLocationPosition();
                    await getLocation(position);
                  },
                  child: Text(location == null
                      ? 'Click to enter your location'
                      : location!),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Phone Number',
                    controller: numberController,
                    isCustomer: true,
                  ),
                ),
                AlertDropDown(
                    items: paymentMethods,
                    labelText: 'Payment',
                    hintText: 'Cash',
                    onTap: (value) {
                      payment = value.toString();
                    },
                    value: 'Cash'),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Opening Balance',
                    controller: balanceController,
                    isCustomer: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    isCustomer: false,
                    labelText: 'PayTime',
                    controller: dateController,
                    icon: Icons.calendar_today,
                    onTap: () async {
                      final List<DateTime>? picked =
                          await showDialog<List<DateTime>>(
                        context: context,
                        builder: (BuildContext context) {
                          return const AwesomeCalendarDialog(
                            selectionMode: SelectionMode.multi,
                            canToggleRangeSelection: true,
                          );
                        },
                      );
                      final formattedDate =
                          DateFormatter.formateDate(picked!.first);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Credit Limit',
                    controller: creditController,
                    isCustomer: true,
                  ),
                ),
                //         AdditionTextField(), //TODO custom field with additon
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Shipping Address',
                    controller: shippingAddressController,
                    isCustomer: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Discount Percentage',
                    controller: discountController,
                    isCustomer: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Bio',
                    controller: bioController,
                    isCustomer: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(onPrimary: Colors.white),
                        onPressed: () {},
                        child: Text(
                            'Save as Walk in Customer(A Customer with no information)')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(onPrimary: Colors.white),
                        onPressed: () async {
                          addingCustomer(
                            context: context,
                            name: nameController.text,
                            bio: bioController.text,
                            type: payment,
                            location: location == null ? '' : location!,
                            phoneNumber: numberController.text,
                            paymentType: payment,
                            date: dateController.text,
                            openingBalance: balanceController.text,
                            shippingAddress: shippingAddressController.text,
                            creditLimit: creditController.text,
                            discountPercentage: discountController.text,
                          );
                        },
                        child: Text('Save ')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
