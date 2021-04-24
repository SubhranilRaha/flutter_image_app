import 'package:wallpaperhubapp/model/categories_model.dart';

String apiKey='563492ad6f9170000100000140377e0a05094bbbaed78686b44886be';

List<CategoriesModel> getCategories() {

  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = new CategoriesModel();


  //
  categoriesModel.imgUrl='https://i.redd.it/9k5qhq26yor61.jpg';
  categoriesModel.categoriesName='abstract';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://pbs.twimg.com/media/DkE8FNVUUAI6K0z?format=png&name=small';
  categoriesModel.categoriesName='pattern';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://i.pinimg.com/564x/e8/64/de/e864de604237e8bbd7656cb8d79d8f70.jpg';
  categoriesModel.categoriesName='minimalist';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://wallpapercave.com/wp/wp5201279.png';
  categoriesModel.categoriesName='neon';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


  return categories;

}