import 'package:flutter/material.dart';


class PetSalesPage extends StatefulWidget {
  @override
  _PetSalesPageState createState() => _PetSalesPageState();
}

class _PetSalesPageState extends State<PetSalesPage> {
  int _selectedAge = 0;
  String _selectedGender = 'Any';
  String _selectedLocation = 'Any';
  String _price = '';

  List<String> _genders = ['Any', 'Male', 'Female'];
  List<String> _locations = ['Any', 'alex', 'cairo', 'giza'];

  @override
  Widget build(BuildContext context) {
    List<int> _ages = List.generate(
        61, (index) => index); // Numeric age range 0 to 60 months (5 years)

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Pet Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/75-01.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                child: PageView(
                  children: [
                    _buildImage(
                        'https://via.placeholder.com/400x300'), // Placeholder image URL 1
                    _buildImage(
                        'https://via.placeholder.com/400x300'), // Placeholder image URL 2
                    _buildImage(
                        'https://via.placeholder.com/400x300'), // Placeholder image URL 3
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Pet',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildDropdown(
                          'Age (Months)',
                          _ages.map((age) => age.toString()).toList(),
                          _selectedAge.toString(), (value) {
                        setState(() {
                          _selectedAge =
                              int.parse(value); // Convert selected value to int
                        });
                      }),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildDropdown('Gender', _genders, _selectedGender,
                              (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildDropdown('Location', _locations, _selectedLocation,
                        (value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    }),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                  keyboardType:
                  TextInputType.number, // Allow only numeric input
                  onChanged: (value) {
                    setState(() {
                      _price = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sell button press
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text(
                    'Sell Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: OutlinedButton(
                  onPressed: () {
                    // Handle contact button press
                    // Add your logic here
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text(
                    'Contact Seller',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, String value, Function onChanged) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (newValue) => onChanged(newValue),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PetSalesPage(),
  ));
}
