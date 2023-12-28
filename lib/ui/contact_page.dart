import 'package:advertech_task/data/form_sender.dart';
import 'package:advertech_task/ui/custom_text_form_field.dart';
import 'package:advertech_task/ui/send_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

///Home page widget
class ContactPage extends StatefulWidget {
  ///Widget constructor
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final FormSender _formSender = FormSender();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Contact us',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    keyField: const Key('name_field'),
                    fieldName: 'Name',
                    textEditingController: _nameController,
                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return 'Please enter a valid name';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    keyField: const Key('email_field'),
                    fieldName: 'Email',
                    textEditingController: _emailController,
                    validator: (value) {
                      if (!EmailValidator.validate(value!)) {
                        return 'Please enter a valid email address';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    keyField: const Key('message_field'),
                    fieldName: 'Message',
                    textEditingController: _messageController,
                    validator: (value) {
                      if (value == null || value.length < 10) {
                        return 'Please enter a valid message';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () async {
                      final currentState = _formKey.currentState;
                      if (currentState != null && currentState.validate()){

                        setState(() {
                          _isLoading = true;
                        });

                        final response = await _formSender.postData(
                            name: _nameController.text,
                            email: _emailController.text,
                            message: _messageController.text,
                        );

                        setState(() {
                          _isLoading = false;
                        });

                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(response),
                           ),
                         );
                      }
                    },
                    child: _isLoading
                        ? const Text('Please wait')
                        : const SendButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
