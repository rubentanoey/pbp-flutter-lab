# Assignment 7: Implementasi Form dan Autentikasi dengan Django

#### Nama    : Ruben Tanoey
#### NPM     : 2106752445
#### Kelas   : D

## Stateless widget dan stateful widget
`Stateless widget` mengirimkan request ke server dan melanjutkan respon / statenya kembali tanpa mengirimkan data apapun. Sebaliknya, `stateful widget` mengekspetasikan respon, *track information*, dan mengriimkan kembali request jika tidak ada respon yang diterima.

## Widget yang dipakai dalam aplikasi counter_7
`Appbar`    : Komponen paling atas dari suatu app, berisi toolbar dan action buttons.
`Center`    : Widget built-in yang mengatur widget child-nya ke tengah layar.
`Column`    : Widget yang membuat child-nya terurut secara vertikal.
`Text`      : Widget yang menampilkan string sebuat text.
`Visibiliy` : Property yang mengontrol suatu child visible atau tidak.
`FloatingActionButton`  : Button lingkaran yang memicu aksi primer, biasa di ujung bawah kanan aplikasi.

## SetState()
`SetState()` adalah suatu fungsi yang akan melakukan pembangunan ulang widget-widget yang ada karena suatu kondisi tertentu. Seperti perubahan ketika nilai _counter dari 0 -> 1, akan membuat widget button decrement muncul. Tanpa `setState()`, tidak ada perubahan pada tampilan dari aplikasi tersebut.

## Perbedaan Const dan Final
`final` memiliki maksud bahwa variabel yang ada bersifat single-assignment. Ketika dimasukkan suatu value, value yang ada tidak dapat diganti atau di-replace. Sebaliknya, `const` dapat berupa objek yang ditampilkan dari data yang diperoleh saat *compile time*.

## Implemtasi
- Membuat aplikasi baru counter_7
    ```dart
        flutter create counter_7
    ```
- Membuat fungsi untuk decrement.
    ```dart
    void _decrementCounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter--;
      });
    }
    ```
- Membuat button untuk decrement dengan bantuan widget visibilty untuk mengatur visibilitas button decrement sesuai kondisi.
    ```dart
    floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: _counter != 0,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
    ...
    ```
- Membuat text yang memunculkan text 'GANJIL' dan 'GENAP' sesuai kondisi.
    ```dart
    ...
    children: <Widget>[
            _counter % 2 == 0 ?
              const Text(
                style: TextStyle(color: Colors.red),'GENAP'
              ) :
              const Text(
                style: TextStyle(color: Colors.blue), 'GANJIL'
              ),
    ...
    ```