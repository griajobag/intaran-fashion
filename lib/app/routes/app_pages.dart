import 'package:get/get.dart';

import '../modules/detail_transaksi/bindings/detail_transaksi_binding.dart';
import '../modules/detail_transaksi/views/detail_transaksi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan_pemasukan/bindings/laporan_pemasukan_binding.dart';
import '../modules/laporan_pemasukan/views/laporan_pemasukan_view.dart';
import '../modules/laporan_pengeluaran/bindings/laporan_pengeluaran_binding.dart';
import '../modules/laporan_pengeluaran/views/laporan_pengeluaran_view.dart';
import '../modules/list_catatan/bindings/list_catatan_binding.dart';
import '../modules/list_catatan/views/list_catatan_view.dart';
import '../modules/list_data_barang/bindings/list_data_barang_binding.dart';
import '../modules/list_data_barang/views/list_data_barang_view.dart';
import '../modules/list_data_pengeluaran/bindings/list_data_pengeluaran_binding.dart';
import '../modules/list_data_pengeluaran/views/list_data_pengeluaran_view.dart';
import '../modules/list_metode_pembayaran/bindings/list_metode_pembayaran_binding.dart';
import '../modules/list_metode_pembayaran/views/list_metode_pembayaran_view.dart';
import '../modules/list_transaksi/bindings/list_transaksi_binding.dart';
import '../modules/list_transaksi/views/list_transaksi_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/sliding_tab_laporan/bindings/sliding_tab_laporan_binding.dart';
import '../modules/sliding_tab_laporan/views/sliding_tab_laporan_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tambah_barang/bindings/tambah_barang_binding.dart';
import '../modules/tambah_barang/views/tambah_barang_view.dart';
import '../modules/tambah_catatan/bindings/tambah_catatan_binding.dart';
import '../modules/tambah_catatan/views/tambah_catatan_view.dart';
import '../modules/tambah_metode_pembayaran/bindings/tambah_metode_pembayaran_binding.dart';
import '../modules/tambah_metode_pembayaran/views/tambah_metode_pembayaran_view.dart';
import '../modules/tambah_pengeluaran/bindings/tambah_pengeluaran_binding.dart';
import '../modules/tambah_pengeluaran/views/tambah_pengeluaran_view.dart';
import '../modules/tambah_transaksi/bindings/tambah_transaksi_binding.dart';
import '../modules/tambah_transaksi/views/tambah_transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_METODE_PEMBAYARAN,
      page: () => TambahMetodePembayaranView(),
      binding: TambahMetodePembayaranBinding(),
    ),
    GetPage(
      name: _Paths.LIST_METODE_PEMBAYARAN,
      page: () => ListMetodePembayaranView(),
      binding: ListMetodePembayaranBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_BARANG,
      page: () => TambahBarangView(),
      binding: TambahBarangBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DATA_BARANG,
      page: () => ListDataBarangView(),
      binding: ListDataBarangBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PENGELUARAN,
      page: () => TambahPengeluaranView(),
      binding: TambahPengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DATA_PENGELUARAN,
      page: () => ListDataPengeluaranView(),
      binding: ListDataPengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_TRANSAKSI,
      page: () => TambahTransaksiView(),
      binding: TambahTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TRANSAKSI,
      page: () => ListTransaksiView(),
      binding: ListTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI,
      page: () => DetailTransaksiView(),
      binding: DetailTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_CATATAN,
      page: () => TambahCatatanView(),
      binding: TambahCatatanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CATATAN,
      page: () => ListCatatanView(),
      binding: ListCatatanBinding(),
    ),
    GetPage(
      name: _Paths.SLIDING_TAB_LAPORAN,
      page: () => SlidingTabLaporanView(),
      binding: SlidingTabLaporanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PEMASUKAN,
      page: () => LaporanPemasukanView(),
      binding: LaporanPemasukanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PENGELUARAN,
      page: () => LaporanPengeluaranView(),
      binding: LaporanPengeluaranBinding(),
    ),
  ];
}
