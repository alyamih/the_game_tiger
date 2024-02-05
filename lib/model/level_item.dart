class LevelItem {
  int? levelNumber;
  bool? isSimpleCompleted;
  bool? isMediumCompleted;
  bool? isHardCompleted;

  LevelItem(
      {this.levelNumber,
      this.isSimpleCompleted,
      this.isMediumCompleted,
      this.isHardCompleted});

  factory LevelItem.fromJson(Map<String, dynamic> parsedJson) {
    return LevelItem(
      levelNumber: parsedJson['levelNumber'],
      isSimpleCompleted: parsedJson['isSimpleCompleted'],
      isMediumCompleted: parsedJson['isMediumCompleted'],
      isHardCompleted: parsedJson['isHardCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'levelNumber': levelNumber,
      'isSimpleCompleted': isSimpleCompleted,
      'isMediumCompleted': isMediumCompleted,
      'isHardCompleted': isHardCompleted,
    };
  }
}
