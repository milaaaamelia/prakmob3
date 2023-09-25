import 'package:flutter/material.dart';
import 'package:prakmob3/bloc/authentication_bloc.dart';
import 'package:prakmob3/widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const SideMenu(),
      body: BlocBuilder <AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoggedInState) {
            return _buildLoggedInContent(context);
          } else {
            return _buildLoggedOutContent(context);
          }
        },
      ),
    );
  }

  Widget _buildLoggedInContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Selamat Datang!',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLogoutEvent());
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoggedOutContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Anda belum login.',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
             
              Navigator.of(context).pushNamed('/login');
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class BlocProvider {
  static of(BuildContext context) {}
}

// ignore: non_constant_identifier_names
BlocBuilder({required Widget Function(dynamic context, dynamic state) builder}) {
}
