import 'package:home_services_app/features/service_request/data/models/service_model.dart';

class StaticServices {
  static List<ServiceDetailsModel> services = [
    ServiceModel(
      title: "Plumbing",
      imagePath: "assets/images/plumbing_icon.png",
      description:
      "Our expert plumbers provide comprehensive plumbing services including leak repairs, pipe installations, and maintenance.",
      price: "\$50 - \$200 depending on the service.",
      services: [
        "Leak detection and repair",
        "Pipe and faucet installation",
        "Bathroom and kitchen plumbing",
        "Water heater services",
      ],
    ),
    ServiceModel(
      title: "Carpentry",
      imagePath: "assets/images/carpentry.png",
      description:
      "Our skilled carpenters create and repair wooden structures and furniture with high precision and craftsmanship.",
      price: "\$70 - \$250 depending on the job.",
      services: [
        "Furniture assembly and repair",
        "Door and window installation",
        "Shelving and cabinet building",
        "Custom woodwork",
      ],
    ),
    ServiceModel(
      title: "Electrical",
      imagePath: "assets/images/electrical_icon.png",
      description:
      "Certified electricians providing safe and efficient electrical installations, repairs, and upgrades for homes and businesses.",
      price: "\$60 - \$220 depending on the task.",
      services: [
        "Wiring and rewiring",
        "Lighting installation",
        "Electrical troubleshooting",
        "Circuit breaker upgrades",
      ],
    ),
    ServiceModel(
      title: "Painting",
      imagePath: "assets/images/painting_icon.png",
      description:
      "Professional painting services to refresh and beautify your interior and exterior spaces using high-quality materials.",
      price: "\$80 - \$300 depending on area and work.",
      services: [
        "Interior wall painting",
        "Exterior building painting",
        "Wallpaper removal",
        "Custom finishes",
      ],
    ),
    ServiceModel(
      title: "Pest Control",
      imagePath: "assets/images/pest_control_icon.png",
      description:
      "Effective and eco-friendly pest control services targeting insects, rodents, and other household pests.",
      price: "\$40 - \$180 depending on the infestation.",
      services: [
        "Termite treatment",
        "Rodent removal",
        "Insect spraying",
        "Preventive measures",
      ],
    ),
    ServiceModel(
      title: "Cleaning",
      imagePath: "assets/images/cleaning_icon.png",
      description:
      "Thorough and reliable cleaning services for homes, offices, and post-renovation areas with trained professionals.",
      price: "\$30 - \$150 depending on space and requirements.",
      services: [
        "Home deep cleaning",
        "Office cleaning",
        "Post-construction cleaning",
        "Window and carpet cleaning",
      ],
    ),
  ];
}
