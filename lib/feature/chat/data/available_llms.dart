enum AvailableLlms {
  gemini3_8Flash('gemini-3.8-flash', 'Gemini 3.8 Flash'),
  gemini3_7Flash('gemini-3.7-flash', 'Gemini 3.7 Flash'),
  gemini3_6Flash('gemini-3.6-flash', 'Gemini 3.6 Flash'),
  gemini3_5FlashLite('gemini-3.5-flash-lite', 'Gemini 3.5 Flash-Lite'),
  gemini3_1FlashLite('gemini-3.1-flash-lite', 'Gemini 3.1 Flash-Lite'),
  gemini3_1ProPreview('gemini-3.1-pro-preview', 'Gemini 3.1 Pro (Preview)');

  final String label;
  final String displayName;

  const AvailableLlms(this.label, this.displayName);
}
