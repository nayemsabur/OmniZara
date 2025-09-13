import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Selection Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DeliveryAddressScreen(),
    );
  }
}

class DeliveryAddressScreen extends StatefulWidget {
  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _searchController = TextEditingController();

  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  String? _selectedAddress;
  Set<Marker> _markers = {};
  bool _isLoading = false;

  static final CameraPosition _kDefaultPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 14.0,
  );

  final List<String> _addressSuggestions = [
    "Golden Gate Bridge, San Francisco, CA",
    "Fisherman's Wharf, San Francisco, CA",
    "Alcatraz Island, San Francisco, CA",
    "Lombard Street, San Francisco, CA",
    "Chinatown, San Francisco, CA",
    "Union Square, San Francisco, CA",
    "Palace of Fine Arts, San Francisco, CA",
    "Coit Tower, San Francisco, CA",
    "Twin Peaks, San Francisco, CA",
    "Oracle Park, San Francisco, CA"
  ];

  @override
  void initState() {
    super.initState();
    _selectedLocation = _kDefaultPosition.target;
    _addMarker(_selectedLocation!, "Selected Location");
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _addMarker(LatLng position, String title) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('selected-location'),
          position: position,
          infoWindow: InfoWindow(title: title),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  Future<void> _reverseGeocode(LatLng location) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(milliseconds: 800));

    setState(() {
      _selectedLocation = location;
      _selectedAddress = "${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}";
      _addressController.text = "Near $location";
      _cityController.text = "San Francisco";
      _stateController.text = "CA";
      _zipCodeController.text = "94102";
      _countryController.text = "United States";
      _isLoading = false;
    });

    _addMarker(location, "Selected Location");
  }

  Future<List<String>> _getPlaceSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _addressSuggestions
        .where((address) => address.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> _geocodeAddress(String address) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(milliseconds: 800));
    LatLng newLocation;

    if (address.contains("Golden Gate Bridge")) {
      newLocation = LatLng(37.8199, -122.4783);
    } else if (address.contains("Fisherman's Wharf")) {
      newLocation = LatLng(37.8080, -122.4177);
    } else if (address.contains("Alcatraz")) {
      newLocation = LatLng(37.8267, -122.4233);
    } else if (address.contains("Lombard Street")) {
      newLocation = LatLng(37.8021, -122.4186);
    } else if (address.contains("Chinatown")) {
      newLocation = LatLng(37.7941, -122.4078);
    } else {
      // Default to a random nearby location for other addresses
      final offset = _addressSuggestions.indexOf(address) * 0.001;
      newLocation = LatLng(
        _kDefaultPosition.target.latitude + offset,
        _kDefaultPosition.target.longitude + offset,
      );
    }

    setState(() {
      _selectedLocation = newLocation;
      _selectedAddress = address;
      _isLoading = false;
    });

    _addMarker(newLocation, address);
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: newLocation, zoom: 16),
      ),
    );
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Address saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Delivery Address',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Search bar
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for an address...',
                      prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await _getPlaceSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blueAccent),
                      title: Text(suggestion.toString()),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _searchController.text = suggestion.toString();
                    _geocodeAddress(suggestion.toString());
                  },
                ),
              ),

              // Map section
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: _kDefaultPosition,
                      onMapCreated: (controller) {
                        setState(() {
                          _mapController = controller;
                        });
                      },
                      onTap: (LatLng location) {
                        _reverseGeocode(location);
                      },
                      markers: _markers,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                    ),
                    if (_isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                        ),
                      ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Current location feature would be implemented here'),
                            ),
                          );
                        },
                        child: Icon(Icons.my_location),
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.all(16),
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECTED LOCATION',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _selectedAddress ?? 'Tap on the map to select a location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Address form
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Address Details',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                        ),
                        SizedBox(height: 16),
                        _buildInputField(
                          controller: _addressController,
                          label: 'Address',
                          icon: Icons.location_on,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        _buildInputField(
                          controller: _cityController,
                          label: 'City',
                          icon: Icons.location_city,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your city';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        _buildInputField(
                          controller: _stateController,
                          label: 'State',
                          icon: Icons.place,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your state';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        _buildInputField(
                          controller: _zipCodeController,
                          label: 'ZIP Code',
                          icon: Icons.map,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ZIP code';
                            }
                            if (!RegExp(r'^\d{5}(-\d{4})?$').hasMatch(value)) {
                              return 'Please enter a valid ZIP code';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        _buildInputField(
                          controller: _countryController,
                          label: 'Country',
                          icon: Icons.flag,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your country';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            onPressed: _saveAddress,
                            child: Text(
                              'Save Address',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              elevation: 5,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}