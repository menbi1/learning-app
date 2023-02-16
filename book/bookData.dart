
class Books {
  String title;

  String picture;


  Books(
      {required this.title,

        required this.picture,
      });
}
List<Books> bookList = [
  Books(
    title: 'Grade5maths.pdf',

    picture: "assets/icons/pdf.png",),
  Books(
    title: 'Grade9physics.pdf',

    picture: "assets/icons/pdf.png",),

];