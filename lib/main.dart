// ENHANCED FLUTTER FOOD ORDERING APP WITH SEARCH, PROFILE EDITING & DESIGN
// Copy into lib/main.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Express',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF), // Changed to purple
          brightness: Brightness.light,
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6584),
          tertiary: const Color(0xFF36D1DC),
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ---------------- SPLASH SCREEN ----------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Auth.userEmail != null ? const MainApp() : const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.tertiary!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.restaurant,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Foodie Express',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Delicious food delivered fast',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- ONBOARDING SCREEN ----------------
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Discover Amazing Food',
      'description': 'Browse through our diverse menu of delicious dishes from top-rated restaurants',
      'icon': Icons.fastfood,
      'color': Color(0xFF6C63FF),
    },
    {
      'title': 'Fast Delivery',
      'description': 'Get your favorite food delivered to your doorstep in 30 minutes or less',
      'icon': Icons.delivery_dining,
      'color': Color(0xFFFF6584),
    },
    {
      'title': 'Easy Ordering',
      'description': 'Simple, secure checkout and real-time order tracking',
      'icon': Icons.shopping_bag,
      'color': Color(0xFF36D1DC),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                page['color'].withOpacity(0.1),
                                page['color'].withOpacity(0.3),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            page['icon'],
                            size: 100,
                            color: page['color'],
                          ),
                        ),
                        const SizedBox(height: 48),
                        Text(
                          page['title'],
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page['description'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- AUTH MOCK ----------------
class Auth {
  static String? userEmail;
  static String? userName;
  static String? userPhone;
  static String? userAddress;
  static String? userProfileImage;

  static bool login(String email, String password) {
    if (email.isNotEmpty && password.length >= 6) {
      userEmail = email;
      userName = email.split('@')[0];
      userPhone = '+1 234 567 8900';
      userAddress = '123 Main St, New York, NY';
      userProfileImage = null;
      return true;
    }
    return false;
  }

  static bool signup(String email, String password, String name, {String? phone, String? address}) {
    if (email.isNotEmpty && password.length >= 6 && name.isNotEmpty) {
      userEmail = email;
      userName = name;
      userPhone = phone ?? '+1 234 567 8900';
      userAddress = address ?? '123 Main St, New York, NY';
      userProfileImage = null;
      return true;
    }
    return false;
  }

  static void updateProfile(String name, String phone, String address) {
    userName = name;
    userPhone = phone;
    userAddress = address;
  }

  static void logout() {
    userEmail = null;
    userName = null;
    userPhone = null;
    userAddress = null;
    userProfileImage = null;
  }
}

// ---------------- LOGIN PAGE ----------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() => _isLoading = false);
      if (Auth.login(_emailController.text, _passwordController.text)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainApp()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Invalid credentials. Please try again.'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Theme.of(context).colorScheme.primary),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignupPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    'or continue with',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(Icons.g_mobiledata, 'Google'),
                    const SizedBox(width: 20),
                    _buildSocialButton(Icons.facebook, 'Facebook'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: Colors.grey[300]!),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}

// ---------------- SIGNUP PAGE ----------------
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() => _isLoading = false);
      if (Auth.signup(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
        phone: _phoneController.text,
        address: _addressController.text,
      )) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainApp()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign up to get started',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone, color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address (Optional)',
                    prefixIcon: Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Theme.of(context).colorScheme.primary),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).colorScheme.primary),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                    ),
                  ),
                  obscureText: _obscureConfirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- MODELS ----------------
class Food {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category;
  final String image;
  final bool isFavorite;
  final double rating;
  final int prepTime;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.isFavorite = false,
    this.rating = 4.5,
    this.prepTime = 25,
  });
}

class Restaurant {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String deliveryTime;
  final String category;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.deliveryTime,
    required this.category,
  });
}

// ---------------- DATA ----------------
final List<Food> foods = [
  Food(
    id: '1',
    name: 'Classic Burger',
    price: 8.99,
    description: 'Juicy beef patty with fresh veggies and special sauce',
    category: 'Burgers',
    image: '🍔',
    rating: 4.8,
    prepTime: 20,
  ),
  Food(
    id: '2',
    name: 'Pepperoni Pizza',
    price: 12.99,
    description: 'Classic pizza with mozzarella and pepperoni',
    category: 'Pizza',
    image: '🍕',
    rating: 4.7,
    prepTime: 30,
  ),
  Food(
    id: '3',
    name: 'Sushi Platter',
    price: 18.50,
    description: 'Assorted fresh sushi with wasabi and soy sauce',
    category: 'Japanese',
    image: '🍣',
    rating: 4.9,
    prepTime: 25,
  ),
  Food(
    id: '4',
    name: 'Caesar Salad',
    price: 7.99,
    description: 'Fresh romaine with Caesar dressing and croutons',
    category: 'Salads',
    image: '🥗',
    rating: 4.5,
    prepTime: 15,
  ),
  Food(
    id: '5',
    name: 'Chocolate Lava Cake',
    price: 6.50,
    description: 'Warm chocolate cake with molten center and ice cream',
    category: 'Desserts',
    image: '🍰',
    rating: 4.8,
    prepTime: 10,
  ),
  Food(
    id: '6',
    name: 'Grilled Salmon',
    price: 16.99,
    description: 'Fresh salmon with lemon butter sauce and vegetables',
    category: 'Seafood',
    image: '🐟',
    rating: 4.6,
    prepTime: 25,
  ),
  Food(
    id: '7',
    name: 'Chicken Burger',
    price: 9.50,
    description: 'Grilled chicken patty with lettuce and mayo',
    category: 'Burgers',
    image: '🍗',
    rating: 4.6,
    prepTime: 18,
  ),
  Food(
    id: '8',
    name: 'Margherita Pizza',
    price: 11.99,
    description: 'Classic tomato and mozzarella pizza',
    category: 'Pizza',
    image: '🍕',
    rating: 4.7,
    prepTime: 28,
  ),
  Food(
    id: '9',
    name: 'Tacos',
    price: 10.50,
    description: 'Mexican tacos with beef, salsa, and cheese',
    category: 'Mexican',
    image: '🌮',
    rating: 4.4,
    prepTime: 15,
  ),
  Food(
    id: '10',
    name: 'Pasta Carbonara',
    price: 13.99,
    description: 'Italian pasta with egg, cheese, and bacon',
    category: 'Italian',
    image: '🍝',
    rating: 4.6,
    prepTime: 20,
  ),
];

final List<String> categories = [
  'All',
  'Burgers',
  'Pizza',
  'Japanese',
  'Desserts',
  'Salads',
  'Seafood',
  'Mexican',
  'Italian',
];

final List<Restaurant> restaurants = [
  Restaurant(
    id: '1',
    name: 'Burger Palace',
    image: '🏰',
    rating: 4.8,
    deliveryTime: '20-30 min',
    category: 'Fast Food',
  ),
  Restaurant(
    id: '2',
    name: 'Pizza Heaven',
    image: '🍕',
    rating: 4.7,
    deliveryTime: '25-35 min',
    category: 'Italian',
  ),
  Restaurant(
    id: '3',
    name: 'Sushi Master',
    image: '🍣',
    rating: 4.9,
    deliveryTime: '30-40 min',
    category: 'Japanese',
  ),
];

// ---------------- CART MANAGEMENT ----------------
class CartItem {
  final Food food;
  int quantity;
  final String? specialInstructions;

  CartItem({
    required this.food,
    this.quantity = 1,
    this.specialInstructions,
  });

  double get total => food.price * quantity;

  CartItem copyWith({
    Food? food,
    int? quantity,
    String? specialInstructions,
  }) {
    return CartItem(
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      specialInstructions: specialInstructions ?? this.specialInstructions,
    );
  }
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(Food food, {String? specialInstructions}) {
    final existingIndex = _items.indexWhere((item) => item.food.id == food.id);
    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(CartItem(
        food: food,
        specialInstructions: specialInstructions,
      ));
    }
    notifyListeners();
  }

  void removeItem(String foodId) {
    _items.removeWhere((item) => item.food.id == foodId);
    notifyListeners();
  }

  void updateQuantity(String foodId, int quantity) {
    final index = _items.indexWhere((item) => item.food.id == foodId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get total => _items.fold(
        0,
        (sum, item) => sum + item.total,
      );

  int get itemCount => _items.fold(
        0,
        (sum, item) => sum + item.quantity,
      );
}

// ---------------- MAIN APP ----------------
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  final CartProvider _cartProvider = CartProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(cartProvider: _cartProvider),
          SearchScreen(cartProvider: _cartProvider),
          CartScreen(cartProvider: _cartProvider),
          ProfileScreen(cartProvider: _cartProvider),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: ListenableBuilder(
            listenable: _cartProvider,
            builder: (context, child) {
              return BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Colors.grey[600],
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: _currentIndex == 0
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary!,
                                  Theme.of(context).colorScheme.tertiary!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: Icon(
                        _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                        color: _currentIndex == 0 ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: _currentIndex == 1
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary!,
                                  Theme.of(context).colorScheme.tertiary!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: Icon(
                        _currentIndex == 1 ? Icons.search : Icons.search_outlined,
                        color: _currentIndex == 1 ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: _currentIndex == 2
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.primary!,
                                      Theme.of(context).colorScheme.tertiary!,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                )
                              : null,
                          child: Icon(
                            _currentIndex == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                            color: _currentIndex == 2 ? Colors.white : Colors.grey[600],
                          ),
                        ),
                        if (_cartProvider.itemCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                _cartProvider.itemCount > 9
                                    ? '9+'
                                    : '${_cartProvider.itemCount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: _currentIndex == 3
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary!,
                                  Theme.of(context).colorScheme.tertiary!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: Icon(
                        _currentIndex == 3 ? Icons.person : Icons.person_outline,
                        color: _currentIndex == 3 ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    label: 'Profile',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME SCREEN - FIXED SEE ALL ----------------
class HomeScreen extends StatefulWidget {
  final CartProvider cartProvider;
  const HomeScreen({super.key, required this.cartProvider});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';
  final List<bool> _favorites = List.generate(foods.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    final filteredFoods = _selectedCategory == 'All'
        ? foods
        : foods.where((food) => food.category == _selectedCategory).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary!,
                      Theme.of(context).colorScheme.tertiary!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${Auth.userName ?? "Guest"}! 👋',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'What would you like to order?',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchScreen(cartProvider: widget.cartProvider),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
                            const SizedBox(width: 12),
                            Text(
                              'Search food or restaurants...',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Show all categories modal
                          _showAllCategories();
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Container(
                          margin: EdgeInsets.only(
                            right: index == categories.length - 1 ? 0 : 12,
                          ),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: _selectedCategory == category,
                            onSelected: (selected) {
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                            selectedColor: Theme.of(context).colorScheme.primary,
                            labelStyle: TextStyle(
                              color: _selectedCategory == category
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Foods',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to All Foods screen
                          _showAllFoods();
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final food = filteredFoods[index];
                  return FoodCard(
                    food: food,
                    isFavorite: _favorites[index],
                    onToggleFavorite: () {
                      setState(() {
                        _favorites[index] = !_favorites[index];
                      });
                    },
                    onAddToCart: () {
                      widget.cartProvider.addItem(food);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added ${food.name} to cart'),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          action: SnackBarAction(
                            label: 'View Cart',
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CartScreen(cartProvider: widget.cartProvider),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                childCount: filteredFoods.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  void _showAllCategories() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'All Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedCategory == category
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedCategory == category
                              ? Theme.of(context).colorScheme.primary!
                              : Colors.grey[200]!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: _selectedCategory == category
                                ? Colors.white
                                : Colors.black,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showAllFoods() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Foods',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return FoodCard(
                      food: food,
                      isFavorite: _favorites[index],
                      onToggleFavorite: () {
                        setState(() {
                          _favorites[index] = !_favorites[index];
                        });
                      },
                      onAddToCart: () {
                        widget.cartProvider.addItem(food);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${food.name} to cart'),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------- FOOD DETAIL SCREEN ----------------
class FoodDetailScreen extends StatefulWidget {
  final Food food;
  final CartProvider cartProvider;
  const FoodDetailScreen({super.key, required this.food, required this.cartProvider});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;
  String _specialInstructions = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[100],
                child: Center(
                  child: Text(
                    widget.food.image,
                    style: const TextStyle(fontSize: 100),
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.food.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary!.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.food.category,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[600],
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.food.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.access_time,
                        color: Colors.grey[500],
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.food.prepTime} min',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Special Instructions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _specialInstructions = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'E.g., no onions, extra sauce...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                      ),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                            ),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: Text(
                                '$_quantity',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            '\$${(widget.food.price * _quantity).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            for (int i = 0; i < _quantity; i++) {
                              widget.cartProvider.addItem(
                                widget.food,
                                specialInstructions: _specialInstructions,
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added $_quantity ${widget.food.name} to cart'),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                action: SnackBarAction(
                                  label: 'View Cart',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CartScreen(cartProvider: widget.cartProvider),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shopping_cart, color: Colors.white, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- SEARCH SCREEN - ENHANCED WITH FOOD DETAIL NAVIGATION ----------------
class SearchScreen extends StatefulWidget {
  final CartProvider cartProvider;
  const SearchScreen({super.key, required this.cartProvider});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Food> _filteredFoods = [];
  List<Restaurant> _filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    _filteredFoods = foods;
    _filteredRestaurants = restaurants;
    _searchController.addListener(_onSearchChanged);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    
    if (query.isEmpty) {
      setState(() {
        _filteredFoods = foods;
        _filteredRestaurants = restaurants;
      });
      return;
    }

    // Filter foods by name, description, or category
    final foodResults = foods.where((food) {
      return food.name.toLowerCase().contains(query) ||
          food.description.toLowerCase().contains(query) ||
          food.category.toLowerCase().contains(query) ||
          // Search by first letter of each word
          food.name.toLowerCase().split(' ').any((word) => word.isNotEmpty && word[0] == query[0]) ||
          // Search by first letters of words
          food.name.toLowerCase().split(' ').map((word) => word.isNotEmpty ? word[0] : '').join().contains(query);
    }).toList();

    // Filter restaurants
    final restaurantResults = restaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(query) ||
          restaurant.category.toLowerCase().contains(query) ||
          restaurant.name.toLowerCase().split(' ').any((word) => word.isNotEmpty && word[0] == query[0]);
    }).toList();

    setState(() {
      _filteredFoods = foodResults;
      _filteredRestaurants = restaurantResults;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _filteredFoods = foods;
      _filteredRestaurants = restaurants;
    });
  }

  void _navigateToFoodDetail(Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FoodDetailScreen(
          food: food,
          cartProvider: widget.cartProvider,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Search food or restaurants...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    hintStyle: TextStyle(fontFamily: 'Poppins'),
                  ),
                  style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  autofocus: true,
                ),
              ),
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear, size: 20, color: Colors.grey),
                  onPressed: _clearSearch,
                ),
            ],
          ),
        ),
      ),
      body: _buildSearchResults(),
    );
  }

  Widget _buildSearchResults() {
    if (_searchController.text.isEmpty) {
      return _buildRecentSearches();
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_filteredRestaurants.isNotEmpty) ...[
          _buildSectionHeader('Restaurants', _filteredRestaurants.length),
          ..._filteredRestaurants.map((restaurant) => _buildRestaurantItem(restaurant)),
          const SizedBox(height: 24),
        ],
        if (_filteredFoods.isNotEmpty) ...[
          _buildSectionHeader('Foods', _filteredFoods.length),
          ..._filteredFoods.map((food) => GestureDetector(
            onTap: () => _navigateToFoodDetail(food),
            child: _buildFoodItem(food),
          )),
        ],
        if (_filteredFoods.isEmpty && _filteredRestaurants.isEmpty)
          _buildNoResults(),
      ],
    );
  }

  Widget _buildRecentSearches() {
    final recentSearches = ['Burger', 'Pizza', 'Sushi', 'Salad', 'Chicken'];
    
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Recent Searches', recentSearches.length),
        ...recentSearches.map((search) => ListTile(
          leading: Icon(Icons.history, color: Theme.of(context).colorScheme.primary),
          title: Text(
            search,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: () {
            _searchController.text = search;
          },
        )),
        const SizedBox(height: 24),
        _buildSectionHeader('Popular Categories', categories.length - 1),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categories
              .where((cat) => cat != 'All')
              .map((category) => GestureDetector(
                    onTap: () {
                      _searchController.text = category;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            '$count found',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantItem(Restaurant restaurant) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(restaurant.image, style: const TextStyle(fontSize: 24)),
          ),
        ),
        title: Text(
          restaurant.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              restaurant.category,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber[600], size: 16),
                const SizedBox(width: 4),
                Text(
                  restaurant.rating.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.access_time, color: Colors.grey[500], size: 16),
                const SizedBox(width: 4),
                Text(
                  restaurant.deliveryTime,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildFoodItem(Food food) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(food.image, style: const TextStyle(fontSize: 24)),
          ),
        ),
        title: Text(
          food.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              food.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber[600], size: 16),
                const SizedBox(width: 4),
                Text(
                  food.rating.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.access_time, color: Colors.grey[500], size: 16),
                const SizedBox(width: 4),
                Text(
                  '${food.prepTime} min',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${food.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                widget.cartProvider.addItem(food);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added ${food.name} to cart'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                minimumSize: const Size(0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 20),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              color: Colors.grey[500],
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _clearSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Clear Search',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- FOOD CARD ----------------
class FoodCard extends StatelessWidget {
  final Food food;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onAddToCart;

  const FoodCard({
    super.key,
    required this.food,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to food detail
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FoodDetailScreen(
              food: food,
              cartProvider: CartProvider(),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      food.image,
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Theme.of(context).colorScheme.secondary : Colors.grey[600],
                        size: 20,
                      ),
                      onPressed: onToggleFavorite,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    food.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${food.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber[600],
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            food.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- CART SCREEN ----------------
class CartScreen extends StatefulWidget {
  final CartProvider cartProvider;
  const CartScreen({super.key, required this.cartProvider});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double _deliveryFee = 2.99;
  bool _isCheckingOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        actions: [
          if (widget.cartProvider.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                _showClearCartDialog();
              },
            ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget.cartProvider,
        builder: (context, child) {
          final cartItems = widget.cartProvider.items;
          final subtotal = widget.cartProvider.total;
          final total = subtotal + _deliveryFee;

          return Column(
            children: [
              Expanded(
                child: cartItems.isEmpty
                    ? _buildEmptyCart()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return _buildCartItem(item);
                        },
                      ),
              ),
              if (cartItems.isNotEmpty)
                _buildCheckoutSection(subtotal, total),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 20),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some delicious food!',
            style: TextStyle(
              color: Colors.grey[500],
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Browse Menu',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Dismissible(
      key: Key(item.food.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.secondary,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      confirmDismiss: (_) async {
        return await _showDeleteDialog(item.food.name);
      },
      onDismissed: (_) {
        widget.cartProvider.removeItem(item.food.id);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    item.food.image,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${item.food.price.toStringAsFixed(2)} each',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              _buildQuantityControls(item),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityControls(CartItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 18),
            onPressed: () {
              if (item.quantity > 1) {
                widget.cartProvider.updateQuantity(item.food.id, item.quantity - 1);
              } else {
                _showRemoveItemDialog(item.food.name, item.food.id);
              }
            },
          ),
          Container(
            width: 30,
            alignment: Alignment.center,
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            onPressed: () {
              widget.cartProvider.updateQuantity(item.food.id, item.quantity + 1);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(double subtotal, double total) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPriceRow('Subtotal', subtotal),
          const SizedBox(height: 8),
          _buildPriceRow('Delivery Fee', _deliveryFee),
          const SizedBox(height: 16),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 8),
          _buildPriceRow('Total', total, isTotal: true),
          const SizedBox(height: 20),
          _buildCheckoutButton(total),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            color: Colors.grey[600],
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isTotal ? 24 : 16,
            fontWeight: FontWeight.bold,
            color: isTotal ? Theme.of(context).colorScheme.primary : Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton(double total) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isCheckingOut ? null : () => _checkout(total),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isCheckingOut
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_bag, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Checkout \$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _checkout(double total) async {
    setState(() => _isCheckingOut = true);

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isCheckingOut = false);
      _showSuccessDialog(total);
    }
  }

  Future<void> _showSuccessDialog(double total) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green[400],
              size: 30,
            ),
            const SizedBox(width: 12),
            const Text('Order Confirmed!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Your order has been placed successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 16),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Estimated delivery: 30-45 mins',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              widget.cartProvider.clearCart();
              Navigator.pop(context);
            },
            child: const Text(
              'Continue Shopping',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _showDeleteDialog(String foodName) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: Text('Are you sure you want to remove $foodName from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Remove',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void _showRemoveItemDialog(String foodName, String foodId) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: Text('Are you sure you want to remove $foodName from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              widget.cartProvider.removeItem(foodId);
              Navigator.pop(context, true);
            },
            child: Text(
              'Remove',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog() async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: const Text('Are you sure you want to clear your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              widget.cartProvider.clearCart();
              Navigator.pop(context, true);
            },
            child: Text(
              'Clear All',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- EDIT PROFILE SCREEN ----------------
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: Auth.userName);
  final _emailController = TextEditingController(text: Auth.userEmail);
  final _phoneController = TextEditingController(text: Auth.userPhone);
  final _addressController = TextEditingController(text: Auth.userAddress);
  
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = Auth.userName ?? '';
    _emailController.text = Auth.userEmail ?? '';
    _phoneController.text = Auth.userPhone ?? '';
    _addressController.text = Auth.userAddress ?? '';
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() => _isLoading = false);
      Auth.updateProfile(
        _nameController.text,
        _phoneController.text,
        _addressController.text,
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Profile updated successfully!'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveProfile,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary!,
                      Theme.of(context).colorScheme.tertiary!,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    (_nameController.text.isNotEmpty ? _nameController.text[0] : 'G').toUpperCase(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Change profile picture
                },
                child: Text(
                  'Change Profile Picture',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                  ),
                ),
                enabled: false,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone, color: Theme.of(context).colorScheme.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Delivery Address',
                  prefixIcon: Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary!),
                  ),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatefulWidget {
  final CartProvider cartProvider;
  const ProfileScreen({super.key, required this.cartProvider});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary!,
                      Theme.of(context).colorScheme.tertiary!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Center(
                          child: Text(
                            (Auth.userName?.substring(0, 1).toUpperCase() ?? 'G'),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        Auth.userName ?? 'Guest User',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        Auth.userEmail ?? 'No email provided',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('12', 'Orders'),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[300],
                          ),
                          _buildStatItem('\$245', 'Spent'),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[300],
                          ),
                          _buildStatItem('4.8', 'Rating'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Account Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildProfileTile(
                    Icons.person,
                    'Personal Information',
                    Auth.userName ?? 'Not set',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                      );
                    },
                  ),
                  _buildProfileTile(
                    Icons.location_on,
                    'Delivery Address',
                    Auth.userAddress ?? 'Not set',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                      );
                    },
                  ),
                  _buildProfileTile(
                    Icons.phone,
                    'Phone Number',
                    Auth.userPhone ?? 'Not set',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                      );
                    },
                  ),
                  _buildProfileTile(
                    Icons.payment,
                    'Payment Methods',
                    'Visa •••• 4321',
                    () {},
                  ),
                  _buildProfileTile(
                    Icons.notifications,
                    'Notifications',
                    'Enabled',
                    () {},
                  ),
                  _buildProfileTile(
                    Icons.security,
                    'Privacy & Security',
                    'Manage your data',
                    () {},
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Auth.logout();
                        widget.cartProvider.clearCart();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (_) => false,
                        );
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      label: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Theme.of(context).colorScheme.secondary!),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'Poppins',
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}