class OnboardModel {
  final String imageName;
  final String title;
  final String description;

  OnboardModel(
      {required this.imageName,
      required this.title,
      required this.description});

  static List<OnboardModel> getOnboardModelItems = [
    OnboardModel(
      imageName: 'assets/png_images/sushi_onboard_1.png',
      title: 'THE TASTE OF\nJAPANESE FOOD',
      description:
          'Feel the taste of the most popular Japanese food from anywhere and anytime',
    ),
    OnboardModel(
      imageName: 'assets/png_images/sushi_onboard_2.png',
      title: 'EXPERIENCE PERFECTION WITH MILAN SUSHI',
      description:
          'Revel in the luxurious essence and incompara flavors of sushi offered',
    ),
    OnboardModel(
      imageName: 'assets/png_images/sushi_onboard_3.png',
      title: 'THE LUXURY OF SUSHI AT YOUR DOORSTEP',
      description:
          'Enjoy the unparalleled luxury and taste of sushi with tainkan, delivery to your doorstep',
    ),
  ];
}
