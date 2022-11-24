# Assignment 7: Elemen Dasar Flutter

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

## Implementasi
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

# Assignment 8: Flutter Form

#### Nama    : Ruben Tanoey
#### NPM     : 2106752445
#### Kelas   : D

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` merupakan widget yang dapat mengganti route (page) menjadi route selanjutnya. Secara default, `Navigator.push` akan membuat page selanjutnya ter-*store* ke dalam stack of routes atau pages. `Navigator.pushReplacement` mencegah hal tersebut terjadi. Apabila suatu page dilakukan `Navigator.pushReplacement`, maka stack sebelumnya diganti dengan stack saat ini. Berikut dokumentasinya

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Navigator.pushReplacement: Widget untuk mengganti page (route) yang menggantikan posisi stack sebelumnya.
- Form: Widget untuk melakukan grouping dari form field widgets.
- TextFormField: Widget berupa textfield
- InputDecoration: Widget untuk mendekorasi textfield (placeholder, border, etc.)
- ListTile: Widget untuk membuat list atas objek yang terbagi garis

## Sebutkan jenis-jenis _event_ yang ada pada Flutter

- onEnter: *Triggered* ketika mouse pointer memasuki widget yang ditentukan.
- onExit: *Triggered* ketika mouse pointer keluar dari widget.
- onHover: *Triggered* ketika mouse pointer berada di widget, tanpa mengeklik.
- onClick: *Triggered* ketika mouse pointer mengeklik widget.

## Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter.

Ada 2 *function* utama Navigator yang memicu perpindahan page. Pertama, `Navigator.push` membuat page pertama berpindah ke page sebelumnya. Page pertama akan masuk ke dalam `stack of pages`. Sebaliknya, `Navigator.pop` akan mengambil push terakhir pada `stack of pages`.

## Implementasi
1. Membuat Bar Navigasi dengan nama file `nav_burger.dart`
```dart
...
return Drawer(  
  child: Column(  
    children: [  
      // Menambahkan clickable menu  
      ListTile(  
        title: const Text('counter_7'),  
        onTap: () {  
          // Route menu ke halaman utama  
          Navigator.pushReplacement(  
            context,  
            MaterialPageRoute(  
                builder: (context) => const MyHomePage(title: 'counter_7')),  
          );
...
```

2. Masukkan Bar Navigasi (Burger) ke dalam `main.dart`
```dart
...
drawer: const NavBurger(),
...
```

3. Buat objek BudgetProperty pada data_store.dart
4. Buat page untuk input form pada add_budget.dart
5. Buat page yang memunculkan data yang telah diimport pada budget_data.dart

# Assignment 9: # Integrasi Web Service pada Flutter

#### Nama    : Ruben Tanoey
#### NPM     : 2106752445
#### Kelas   : D

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model. Dengan membuat mapping yang dinamis, seperti `MyWatchList.fromJson(Map<String, dynamic> json)`, sebuah objek dengan key dan value. Sayangnya, langkah ini bukanlah *best practice* karena bisa saja ada field yang gagal diisi dan mengakibatkan error

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- DateFormat: Untuk melakukan formatting pada penanggalan
- RoundedRectangleBorder: Untuk membuat border kotak pada suatu container
- FutureBuilder: Widget yang dibentuk pada snapshot terakhir `future:`
- ListView.builder: Widget scrollable yang dapat diisi dengan widget lainnya, misalnya ListTiles

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
1. Pengambilan dilakukan dengan fetching dari suatu web yang menyediakan data json, dengan import `import 'package:http/http.dart' as http`.
2. Kemudian buat method, misalnya `Future<List<MyWatchList>> getWatchList()` untuk melakukan parsing url dan fetching data dari url tersebut dan melakukan return list dari objek-objek yang diperoleh.
3. Pada Route untuk menampilkan data, dibuatlah widget `FutureBuilder` dengan, misalnya, `future: getWatchList` untuk menerima data dan akan mereturn `ListView.builder` berisi data yang telah di-*retrieve* sebelumnya.

## Implementasi Checklist
1. Membuat Models dari MyWatchList dengan bantuan `https://app.quicktype.io/`.
2. Membuat data getter, yaitu file `mywatchlist_webgetter.dart` untuk memperoleh data json dari web
3. Membuat page yang mereturn data, yaitu file `mywatchlist_data` untuk menampilkan list dari MyWacthList yang telah di-*retrieve*.
4. Menambahkan route `MYWatchList` pada Navigation Bar `NavBurger`
5. Membuat Page yang menampilkan detail dari masing-masing set data, yaitu file `mywatchlist_detail`.
6. Melakukan dekorasi pada route utama dengan memanfaatkan widget TextStyle, SizedBox, etc.
7. Buat directory untuk mengelompokkan files, yaitu directory pages, models, dan utils.
8. Lakukan Refactor sehingga semua link yang diimport agar mengalami perubahan secara otomatis.