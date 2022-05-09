class Word {
  var characters = [];
  var charactersImageUtrls = [];
  int size = 0; 
  late String name;

  Word(this.name) {
    size = name.length;
    for (String item in name.split('')) {
      characters.add(item);
      charactersImageUtrls.add('letter-${item.toLowerCase()}.png');
    }
  }
}
