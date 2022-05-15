class Item {
  String _descricao = "";
  String _marca = "";
  String _origem = "";
  double _preco = .0;
  String _unidade = "";
  int _quantidade = 0;
  int _minQuantidade = 0;

  Item() {
    _descricao = "";
    _marca = "";
    _origem = "";
    _preco = .0;
    _unidade = "";
    _quantidade = 0;
    _minQuantidade = 0;
  }

  Item.withData({descricao = "", marca = "", origem = "", preco = "",
                unidade = "", quantidade = "", minQuantidade = ""}) {
    _descricao = descricao;
    _marca = marca;
    _origem = origem;
    _preco = preco;
    _unidade = unidade;
    _quantidade = quantidade;
    _minQuantidade = minQuantidade;
  }

  Item.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
  }

  String get descricao => _descricao;
  String get marca => _marca;
  String get origem => _origem;
  double get preco => _preco;
  String get unidade => _unidade;
  int get quantidade => _quantidade;
  int get minQuantidade => _minQuantidade;

  set descricao(String newDescricao) {
    if (newDescricao.isNotEmpty) {
      _descricao = newDescricao;
    }
  }

  set marca(String newMarca) {
    if (newMarca.isNotEmpty) {
      _marca = newMarca;
    }
  }

  set origem(String newOrigem) {
    if (newOrigem.isNotEmpty) {
      _origem = newOrigem;
    }
  }

  set preco(double newMarca) {
    if (!newMarca.isNaN) {
      _preco = newMarca;
    }
  }

  set unidade(String newUnidade) {
    if (newUnidade.isNotEmpty) {
      _unidade = newUnidade;
    }
  }

  set quantidade(int newMarca) {
    if (!newMarca.isNaN) {
      _quantidade = newMarca;
    }
  }

  set minQuantidade(int newMarca) {
    if (!newMarca.isNaN) {
      _minQuantidade = newMarca;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    return map;
  }
}

class Higiene extends Item {
  // Atributos
  String _funcao = "";

  Higiene() : super();

  Higiene.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
    _funcao = map["funcao"];
  }

  @override
  toMap() {
    var map = Map<String, dynamic>();
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    map['funcao'] = _funcao;
    return map;
  }
}

class Vestuario extends Item {
  // Atributos
  String _tecido = "";
  String _cor = "";
  bool _importado = false;

  Vestuario() : super();

  Vestuario.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
    _tecido = map["tecido"];
    _cor = map["cor"];
    _importado = map["importado"];
  }

  @override
  toMap() {
    var map = Map<String, dynamic>();
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    map['tecido'] = _tecido;
    map['cor'] = _cor;
    map['importado'] = _importado;
    return map;
  }
}

class Cozinha extends Item {
  // Atributos
  DateTime _vencimento = DateTime.now().add(const Duration(days: 7));
  bool _precisaRefrigeracao = false;

  Cozinha() : super();

  Cozinha.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
    _vencimento = map["vencimento"];
    _precisaRefrigeracao = map["precisaRefrigeracao"];
  }

  @override
  toMap() {
    var map = Map<String, dynamic>();
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    map['vencimento'] = _vencimento;
    map['precisaRefrigeracao'] = _precisaRefrigeracao;
    return map;
  }
}