import 'dart:typed_data';

import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_model/screens/customers/widgets/addition_text_field.dart';
import 'package:pos_model/screens/transactions/widgets/alert_drop_down.dart';
import 'package:pos_model/screens/transactions/widgets/alert_text_field.dart';
import 'package:pos_model/utils/date_formatter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
   final TextEditingController shippingAddressController = TextEditingController();
   final TextEditingController dateController = TextEditingController();

  String customerType = '';

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
  Future<String> getLocation()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(position.latitude,position.longitude);
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
                    onTap: (value) {},
                    value: 'Individual'),
              
                InkWell(
                  onTap: (){
                    getLocation();
                  },
                  child: Text(location == null? 'Click to enter your location': location!),),
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
                    onTap: (value) {},
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
                 padding: const EdgeInsets.only(top:8.0),
                 child: AlertTextField(
          
          isCustomer: false,
          labelText: 'Date',
          controller: dateController,
          icon: Icons.calendar_today,
          onTap: () async {
            final List<DateTime>? picked = await showDialog<List<DateTime>>(
              context: context,
              builder: (BuildContext context) {
                  return const AwesomeCalendarDialog(
                    selectionMode: SelectionMode.multi,
                    canToggleRangeSelection: true,
                  );
              },
            );
            final formattedDate = DateFormatter.formateDate(picked!.first);
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
                AdditionTextField(), //TODO custom field with additon
                   Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AlertTextField(
                    labelText: 'Shipping Address',
                    controller: shippingAddressController,
                    isCustomer: true,
                  ),),
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
                        style: ElevatedButton.styleFrom(
                            onPrimary:
                               Colors.white),
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
                        style: ElevatedButton.styleFrom(
                            onPrimary:
                               Colors.white),
                        onPressed: () {},
                        child: Text(
                            'Save ')),
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
