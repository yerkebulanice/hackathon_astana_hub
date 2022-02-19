// ignore_for_file: file_names

class Category {
  final String icon, title;

  Category({required this.icon, required this.title});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/1.png",
    title: "Удобрения",
  ),
  Category(
    icon: "assets/icons/2.png",
    title: "Защита \nрастений",
  ),
  Category(
    icon: "assets/icons/3.png",
    title: "Техника и \nоборудование",
  ),
  Category(
    icon: "assets/icons/4.png",
    title: "Другие \nовары",
  ),
];
