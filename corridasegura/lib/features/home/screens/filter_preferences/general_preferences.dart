import 'package:corridasegura/constants/sizes.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:corridasegura/features/home/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralPreferences extends StatelessWidget {
  const GeneralPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterController controller = Get.put(FilterController());
    final formKey = controller.formKeys[0];

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.localController,
                decoration: const InputDecoration(
                  label: Text(tLocation),
                  hintText: tLocation,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.starsController,
                decoration: const InputDecoration(
                  label: Text(tStars),
                  hintText: tStarsHint,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.star_border_outlined),
                ),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.distanceController,
                decoration: const InputDecoration(
                  label: Text(tDistance),
                  hintText: tDistanceHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.map_outlined),
                )
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.timeController,
                decoration: const InputDecoration(
                  label: Text(tTime),
                  hintText: tTimeHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(tBorderRadius)),
                  ),
                  prefixIcon: Icon(Icons.timer_outlined),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
