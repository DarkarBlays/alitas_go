class chatClass {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final int newMessage;

  chatClass({required this.name, required this.message, required this.time, required this.avatarUrl, required this.newMessage});
}

List<chatClass> temporalData = [
  chatClass(
      name: "Melissa Rincones",
      message: "En cuanto tiempo llega mi pedido?",
      time: "15:30",
      avatarUrl:
      "https://thumbs.dreamstime.com/b/perfil-del-avatar-de-la-mujer-joven-y-elegante-81932605.jpg", newMessage: 1),
  chatClass(
      name: "Ilton Villalobos",
      message: "Hola, hasta que hora atienden?",
      time: "17:30",
      avatarUrl:
      "https://yt3.ggpht.com/a-/AOh14Ggu5Wml45UPksoMVJq2rqctYSp_bLbg3U1zYmoO5g=s288-c-k-c0xffffffff-no-rj-mo", newMessage: 1),
  chatClass(
      name: "Alex Vacca",
      message: "Deseo cancelar mi pedido!",
      time: "5:00",
      avatarUrl:
      "http://sistemas.unicesar.edu.co/images/tlpteam/l_alex-vacca-1623230209.png", newMessage: 0),
  chatClass(
      name: "Miguel Mejia",
      message: "Quiero un adicional de papas",
      time: "10:30",
      avatarUrl:
      "https://static.vecteezy.com/system/resources/previews/001/206/101/non_2x/man-png.png", newMessage: 0),
  chatClass(
      name: "Jose Mejia",
      message: "Tienes promociones de alitas?",
      time: "12:30",
      avatarUrl:
      "https://static.vecteezy.com/system/resources/thumbnails/011/675/367/small_2x/man-avatar-image-for-profile-png.png", newMessage: 0),
  chatClass(
      name: "Lucas Mendoza",
      message: "Traigan vueltos para un billete de 50",
      time: "18:30",
      avatarUrl:
      "https://elrincondeldchome.files.wordpress.com/2019/06/joe-west.jpg?w=500", newMessage: 1),
];