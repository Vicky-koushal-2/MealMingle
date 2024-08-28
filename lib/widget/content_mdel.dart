class UnbordingContent{
  String image;
  String titile;
  String description;
 UnbordingContent({required this.description,required this.image,required this.titile});
}
List<UnbordingContent> contents=[
  UnbordingContent(
      description: 'Pick youre food per menu \n More than 35 times ',
      image: 'assets/screen1.png',
      titile: 'Select from Our Best Menu'),
  UnbordingContent(
      description: 'You can pay cash on delivery on Cash and Card Payment is available',
      image: "assets/screen2.png",
      titile: 'Easy and Only Payment'),
  UnbordingContent(description: 'Delivery youre food at your Doorstep',
      image: "assets/screen3.png",
      titile: 'Quick Delivert at youre Doorstep')
];