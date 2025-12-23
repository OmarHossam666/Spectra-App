import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/features/parent_support/presentation/academy/academy_section.dart';

class ParentSupportScreen extends StatefulWidget {
  const ParentSupportScreen({super.key});

  @override
  State<ParentSupportScreen> createState() => _ParentSupportScreenState();
}

class _ParentSupportScreenState extends State<ParentSupportScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sticky Top Bar Area
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ValuesManager.spaceDefault,
                  vertical: ValuesManager.spaceSmall,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCircleButton(Icons.arrow_back),
                    Text(
                      StringsManager.parentSupport,
                      style: StylesManager.getSubHeadline1(
                        color: ColorsManager.softBlack,
                      ),
                    ),
                    const CircleAvatar(
                      radius: ValuesManager.iconSizeMedium,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=11',
                      ),
                      backgroundColor: ColorsManager.companionAlert,
                    ),
                  ],
                ),
              ), // Tabs
              tabSection(tabController),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ValuesManager.spaceMedium,
        ),
        child: TabBarView(
          controller: tabController,
          children: [
            SingleChildScrollView(child: AcademySection()),

            SingleChildScrollView(
              child: Center(child: Text(StringsManager.community)),
            ),
            SingleChildScrollView(
              child: Center(child: Text(StringsManager.experts)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon) {
    return Container(
      width: ValuesManager.buttonHeightMedium,
      height: ValuesManager.buttonHeightMedium,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: Icon(icon, color: ColorsManager.softBlack),
    );
  }
}

Widget tabSection(TabController tabController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: ValuesManager.spaceDefault),
    child: TabBar(
      controller: tabController,
      tabs: [
        FittedBox(child: Tab(text: StringsManager.academy)),
        FittedBox(child: Tab(text: StringsManager.community)),
        FittedBox(child: Tab(text: StringsManager.experts)),
      ],
    ),
  );
}
