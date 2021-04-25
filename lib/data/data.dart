import 'package:wallpaperhubapp/model/categories_model.dart';

String apiKey='563492ad6f9170000100000140377e0a05094bbbaed78686b44886be';

List<CategoriesModel> getCategories() {

  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = new CategoriesModel();


  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2017/07/03/20/17/abstract-2468874_1280.jpg';
  categoriesModel.categoriesName='Art';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2015/09/09/16/05/forest-931706_1280.jpg';
  categoriesModel.categoriesName='Nature';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2014/09/07/22/34/car-race-438467_1280.jpg';
  categoriesModel.categoriesName='Cars';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2016/04/07/06/53/bmw-1313343_1280.jpg';
  categoriesModel.categoriesName='Bikes';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074_1280.jpg';
  categoriesModel.categoriesName='Dog';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2019/11/08/11/56/cat-4611189_1280.jpg';
  categoriesModel.categoriesName='Cat';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040_1280.jpg';
  categoriesModel.categoriesName='Food';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2017/08/10/02/05/tiles-shapes-2617112_1280.jpg';
  categoriesModel.categoriesName='Pattern';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2017/02/15/13/40/tulips-2068692_1280.jpg';
  categoriesModel.categoriesName='Flower';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712_1280.jpg';
  categoriesModel.categoriesName='Sunset';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  //
  categoriesModel.imgUrl='https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_1280.jpg';
  categoriesModel.categoriesName='Sky';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


  return categories;

}