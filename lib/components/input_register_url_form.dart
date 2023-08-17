import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/registration_url_data.dart';

class InputRegisterUrlForm extends ConsumerStatefulWidget {
  const InputRegisterUrlForm({Key? key}) : super(key: key);

  @override
  _InputRegisterUrlFormState createState() => _InputRegisterUrlFormState();
}

class _InputRegisterUrlFormState extends ConsumerState<InputRegisterUrlForm> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  handleGetThumbnailFromWeb() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(registrationURLDataProvider.notifier)
          .getOgpData(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 800,
            child: TextFormField(
              controller: _controller,
              maxLines: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "URLが入力されてません";
                }
                return null;
              },
              decoration: InputDecoration(
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).cardColor)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  labelText: "URLを入力"),
            ),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: handleGetThumbnailFromWeb,
                child: const Text('サイトの情報を取得')),
          ),
        ],
      ),
    );
  }
}
