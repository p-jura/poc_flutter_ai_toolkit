import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_ai_toolkit_poc/feature/chat/data/available_llms.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, String? prefix})
    : _prefix = prefix ?? 'Current model: ';

  final String _prefix;
  final AvailableLlms _model = AvailableLlms.gemini3_1FlashLite;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late AvailableLlms _model;

  @override
  void initState() {
    _model = widget._model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              Text(
                widget._prefix,
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _model.displayName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.all(8),

                width: MediaQuery.sizeOf(context).width,
                height: 39,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  children: [
                    ...AvailableLlms.values.map((e) {
                      var isFirst = index == 0;
                      var isLast = index == AvailableLlms.values.length;
                      if (index != AvailableLlms.values.length) index++;

                      return Padding(
                        padding: EdgeInsets.only(
                          left: isFirst ? 0 : 8,
                          right: isLast ? 8 : 0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withAlpha(0),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(90),
                              side: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant
                                    .withAlpha(100),
                              ),
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              _model = e;
                            });
                          },
                          child: Text(e.displayName),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: LlmChatView(
                  onErrorCallback: (context, error) {
                    print(error.message);
                  },
                  provider: FirebaseProvider(
                    model: FirebaseAI.googleAI().generativeModel(
                      model: _model.label,
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
