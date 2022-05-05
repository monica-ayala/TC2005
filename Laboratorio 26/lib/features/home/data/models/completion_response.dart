// To parse this JSON data, do
//
//     final completionResponse = completionResponseFromJson(jsonString);

import 'dart:convert';

CompletionResponse completionResponseFromJson(String str) =>
    CompletionResponse.fromJson(json.decode(str));

String completionResponseToJson(CompletionResponse data) =>
    json.encode(data.toJson());

class CompletionResponse {
  CompletionResponse({
    required this.data,
  });

  Data data;

  factory CompletionResponse.fromJson(Map<String, dynamic> json) =>
      CompletionResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
  });

  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
      };
}

class Choice {
  Choice({
    required this.text,
    required this.index,
    required this.logprobs,
    required this.finishReason,
  });

  String text;
  int index;
  dynamic logprobs;
  String finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
        index: json["index"],
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "index": index,
        "logprobs": logprobs,
        "finish_reason": finishReason,
      };
}
