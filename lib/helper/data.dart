import 'package:news_app/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categoryList = [];
  CategoryModel categorieModel;

  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "General";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryList.add(categorieModel);

  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "Technology";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(categorieModel);

  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "Sports";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(categorieModel);

  //1
  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "Business";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  categoryList.add(categorieModel);

  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "Entertainment";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(categorieModel);

  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "Health";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryList.add(categorieModel);

  categorieModel = new CategoryModel();
  categorieModel.categoryTitle = "Science";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryList.add(categorieModel);

  return categoryList;
}
