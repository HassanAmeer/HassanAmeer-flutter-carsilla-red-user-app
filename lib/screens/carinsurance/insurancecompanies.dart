import 'package:carsilla/resources/urls.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:open_share_plus/open.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_share_plus/open_share_plus.dart';
import '../../res/assets.dart';
import '../../vm/insuranceVM.dart';
import 'insurancecompany2.dart';

class Companies extends StatefulWidget {
  final String? type;
  final String? model;
  final String? year;
  const Companies({super.key, this.type, this.model, this.year});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  @override
  void initState() {
    super.initState();

    Provider.of<InsuranceVmC>(context, listen: false)
        .getInsuranceCompaniesVmF(context);
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Insurance Companies',
      //Text('Showing 3 out of 28 insurance companies'),
      body: Consumer<InsuranceVmC>(builder: (context, companyVmVal, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Showing ${companyVmVal.insuranceCompaniesList.length} out of ${companyVmVal.insuranceCompaniesList.length} insurance companies',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 49, 47, 47)),
              ),
            ),
            ListView.builder(
                itemCount: companyVmVal.insuranceCompaniesList.length,
                shrinkWrap: true,
                controller: ScrollController(),
                itemBuilder: (BuildContext context, int index) {
                  final data = companyVmVal.insuranceCompaniesList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Insurancecompany2(
                                type: widget.type,
                                model: widget.model,
                                year: widget.year,
                                companydata: data),
                          ),
                        );
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey.shade200,
                              offset: const Offset(0, 1))
                        ]),
                        child: Column(
                          children: [
                            ListTile(
                              tileColor: Colors.white,
                              leading: Image.network(
                                  ApiUrls.imageUrl + data['company_img']),
                              // leading: Image.asset(ImageAssets.detail),
                              title: Text(
                                data['company_name'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),

                              subtitle: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return SizedBox(
                                    width: 17,
                                    height: 13,
                                    child: index <
                                            int.parse(
                                                data['reviews'].toString())
                                        ? Image.asset(IconAssets.yellowstar)
                                        : Icon(Icons.star,
                                            color: Colors.grey.shade200,
                                            size: 17),
                                  );
                                }),
                              ),

                              trailing: Container(
                                height:
                                    MediaQuery.of(context).size.height * 9 / 10,
                                width:
                                    MediaQuery.of(context).size.width * 2 / 10,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("AED ${data['monthly_charges']}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 143, 19, 10),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                      const Text(
                                        'monthly',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              tileColor: Colors.white,
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 33,
                                    child: GestureDetector(
                                        onTap: () async {
                                          final Uri launchUri = Uri(
                                            scheme: 'tel',
                                            path: data['phone'],
                                          );
                                          await launchUrl(launchUri);
                                        },
                                        child:
                                            Image.asset(IconAssets.phonered)),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: 33,
                                    child: GestureDetector(
                                        onTap: () {
                                          Open.whatsApp(
                                              whatsAppNumber: data['whatsapp'],
                                              text: "From Carsilla");
                                        },
                                        child: Image.asset(ImageAssets.wst)),
                                  )
                                ],
                              ),
                              trailing: const Text(
                                'Explore',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 73, 69, 69),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),

            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
            ///
          ],
        );
      }),
    );
  }
}
