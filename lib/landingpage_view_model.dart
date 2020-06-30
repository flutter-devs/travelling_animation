class Model {
  String imageAsset;
  String country;
  String place;

  Model(this.imageAsset, this.country, this.place);
}

class LandingPageViewModel{
  List<Model> listOFLandingPage = [
    Model("assets/images/london.png", "UK", "London"),
    Model("assets/images/berlin.png", "Germany", "Berlin"),
    Model("assets/images/london.png", "UK", "London"),
    Model("assets/images/berlin.png", "Germany", "Berlin"),
    Model("assets/images/london.png", "UK", "London"),
    Model("assets/images/berlin.png", "Germany", "Berlin"),
    Model("assets/images/london.png", "UK", "London"),
    Model("assets/images/berlin.png", "Germany", "Berlin"),
  ];

}