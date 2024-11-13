import 'package:em/screen/sale/details_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../static/appbar_widget.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listData = [
      {'text': 'Real Estate', 'img': 'assets/logo/Real Estate.png'},
      {'text': 'Household', 'img': 'assets/logo/Household.png'}
    ];
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text("What Are You Selling?",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16)
                // .copyWith(
                //   fontFamily: "RedHatDisplay-Light",
                //   color: Colors.black,
                //   fontSize: 18,
                //   // fontWeight: FontWeight.bold
                // )
                ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(15),
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio: 2 / 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2),
                itemBuilder: (context, int) {
                  return InkWell(
                    onTap: () {
                      switch (int) {
                        case 0:
                          context.push('/sellScreen/realstateSell',
                              extra: {'id': "1"});
                          // context.go('/home', extra: {'id': "0"});
                          break;
                        case 1:
                          context.push('/sellScreen/householdSale',
                              extra: {'id': "1"});
                          break;
                        // case 2:
                        //   // context.push('/profie', extra: {'id': "2"});
                        //   context.push('/sellScreen/householdSale',
                        //       extra: {'id': "1"});
                        //   break;
                        // case 3:
                        //   context.go('/more', extra: {'id': "3"});
                        //   break;
                        default:
                          context.go('/sellScreen', extra: {'id': "1"});
                          break;
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DetailsFormScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              // height: 50,
                              width: 50,
                              child: Image.asset(
                                alignment: Alignment.center,
                                listData[int]['img'] ?? "",
                                height: 50,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              listData[int]['text'] ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "RedHatDisplay-Light",
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
