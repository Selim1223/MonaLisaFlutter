import 'package:flutter/material.dart';


class Artwork extends StatefulWidget {
  const Artwork({super.key, required this.title});
  final String title;

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isfavorite = false;
  bool _showDescription = false;

  void _changeStateFavorite() {
    setState(() {
      _isfavorite = !_isfavorite;
      _isfavorite ? _showSnackbar() : null;
    });
  }

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Oeuvre ajoutée à vos favoris"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: const Center(child: Text("Museum")),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/Mona_Lisa.jpg",
                    height: 500,
                    width: 400,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Opacity(
                        opacity: 0.75,
                        child: Icon(
                          _isfavorite ? Icons.favorite : Icons.favorite,
                          color: _isfavorite ? Colors.red : Colors.white,
                          size: 50,
                          
                        )),
                  ),
                ),
                if (_showDescription)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 400,
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(20),
                      child: const SingleChildScrollView(
                        child: Text(
                          "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 1516, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Mona Lisa',
              style: TextStyle(
                  fontFamily: "Merriweather", fontSize: 30, color: Colors.brown),
            ),
            const Text(
              'Leonard De Vinci',
              style: TextStyle(
                  fontFamily: "Merriweather",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _toggleDescription,
                    icon: Icon(
                      Icons.article,
                      color: _showDescription ? Colors.blue : Colors.brown,
                    )),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: _changeStateFavorite,
                    icon: Icon(
                      _isfavorite ? Icons.favorite : Icons.favorite,
                      color: _isfavorite ? Colors.red : Colors.brown,
                    )),
              ],
            ),
          ],
        ),
      
    );
  }
}

