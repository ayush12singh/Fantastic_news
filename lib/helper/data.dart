/*Th is the category section of our app
(image and name of that category) */

import 'package:flutter_news/model/catmodel.dart';

List<CategoryModel> getCategories() {
  var cat = <CategoryModel>[];
  CategoryModel categorymodel = CategoryModel();

  //Business
  categorymodel.categoryname = "Business";
  categorymodel.imgurl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1171&q=80';
  cat.add(categorymodel);
  CategoryModel categorymodel1 = CategoryModel();

  //Entertainment
  categorymodel1.categoryname = "Entertainment";
  categorymodel1.imgurl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  cat.add(categorymodel1);

  //General
  CategoryModel categorymodel3 = CategoryModel();
  categorymodel3.categoryname = "General";
  categorymodel3.imgurl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  cat.add(categorymodel3);

  //Health
  CategoryModel categorymodel4 = CategoryModel();
  categorymodel4.categoryname = "Health";
  categorymodel4.imgurl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  cat.add(categorymodel4);

  //Science
  CategoryModel categorymodel5 = CategoryModel();
  categorymodel5.categoryname = "Science";
  categorymodel5.imgurl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  cat.add(categorymodel5);

  //Sports
  CategoryModel categorymodel6 = CategoryModel();
  categorymodel6.categoryname = "Sports";
  categorymodel6.imgurl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  cat.add(categorymodel6);

  //Technoogy
  CategoryModel categorymodel7 = CategoryModel();
  categorymodel7.categoryname = "Technology";
  categorymodel7.imgurl =
      'https://images.unsplash.com/photo-1535223289827-42f1e9919769?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
  cat.add(categorymodel7);

  return cat;
}
