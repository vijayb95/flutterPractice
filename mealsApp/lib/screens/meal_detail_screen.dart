import 'package:flutter/material.dart';
import 'package:mealsApp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget _buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.7,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSelectionTitle(context, 'Ingredients'),
              _buildContainer(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  )),
              _buildSelectionTitle(context, 'Preparation Steps'),
              _buildContainer(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text(
                              '# ${index + 1}',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(
                          color: Theme.of(context).primaryColorLight,
                        )
                      ],
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
