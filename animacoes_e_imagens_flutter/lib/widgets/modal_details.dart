import 'package:flutter/material.dart';

class ModalDetails extends StatelessWidget {
  final List<String> subItems;

  // O parâmetro subItems é obrigatório para o funcionamento do modal
  ModalDetails({Key? key, required this.subItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: subItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FadeTransition(
              opacity: AlwaysStoppedAnimation(1.0),
              child: Transform.translate(
                offset: Offset(0, (index * 10.0).toDouble()),
                child: ListTile(
                  title: Text(subItems[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
