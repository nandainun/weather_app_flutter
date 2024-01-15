import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/consts/images.dart';
import 'package:weather_app/consts/strings.dart';
import 'package:weather_app/controllers/main_controller.dart';
import 'package:weather_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lighTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const WeatherApp(),
      title: 'Weather App',
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMMd").format(DateTime.now());
    var theme = Theme.of(context);
    var controller = Get.put(MainController());

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: date.text.color(theme.primaryColor).make(),
        actions: [
          Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 10000),
              child: IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(
                  controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
                  color: theme.iconTheme.color,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: theme.iconTheme.color,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Depok"
                  .text
                  .textStyle(GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold))
                  .color(theme.primaryColor)
                  .letterSpacing(3)
                  .make(),

              // show degree and icons weather
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "30$degree",
                          style: TextStyle(
                            fontSize: 60,
                            color: theme.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: "Cerah",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/weather/03w.png",
                    width: 100,
                    height: 100,
                  )
                ],
              ),

              // description
              Transform.translate(
                offset: const Offset(-10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_less_rounded,
                        color: theme.iconTheme.color,
                      ),
                      label: "41$degree".text.color(theme.primaryColor).make(),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_less_rounded,
                        color: theme.iconTheme.color,
                      ),
                      label: "24$degree".text.color(theme.primaryColor).make(),
                    ),
                  ],
                ),
              ),
              10.heightBox,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) {
                    var iconList = [uv, humidity, windspeed];
                    var desc = ["Indeks UV", "Kelembapan", "Angin"];
                    var values = ["70%", "70%", "70%"];
                    return Column(
                      children: [
                        Image.asset(
                          iconList[index],
                          width: 100,
                          height: 60,
                        ),
                        10.heightBox,
                        desc[index].text.color(theme.primaryColor).semiBold.make(),
                        10.heightBox,
                        values[index].text.color(theme.primaryColor).semiBold.make(),
                      ],
                    ).box.color(theme.cardColor).padding(const EdgeInsets.all(8)).roundedSM.make();
                  },
                ),
              ),

              10.heightBox,
              const Divider(),
              10.heightBox,

              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          "${index + 1} AM".text.color(theme.primaryColor).semiBold.make(),
                          Image.asset(
                            "assets/weather/01w.png",
                            height: 120,
                            width: 70,
                          ),
                          "36$degree".text.color(theme.primaryColor).semiBold.make(),
                        ],
                      ),
                    );
                  },
                ),
              ),

              10.heightBox,
              const Divider(),
              10.heightBox,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Next 7 days".text.size(18).semiBold.color(theme.primaryColor).make(),
                  TextButton(
                    onPressed: () {},
                    child: "View All".text.color(theme.primaryColor).make(),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  var day = DateFormat("EEEE").format(DateTime.now().add(Duration(days: index + 1)));
                  return Card(
                    color: theme.cardColor,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: day.text.color(theme.primaryColor).make(),
                          ),
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/icons/water.png",
                                width: 20,
                              ),
                              label: "70%".text.size(14).color(theme.primaryColor).make(),
                            ),
                          ),
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/weather/01w.png",
                                width: 20,
                              ),
                              label: "27$degree".text.size(14).color(theme.iconTheme.color).make(),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "37$degree /",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: " 24$degree",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
