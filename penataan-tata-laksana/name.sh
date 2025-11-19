#!/usr/bin/env bash
set -euo pipefail

OUTPUT_DIR="file-sop-madrasah"
mkdir -p "$OUTPUT_DIR"

titles=(
  "Penerimaan Peserta Didik Baru (PPDB) Online"
  "Pelayanan Administrasi Siswa"
  "Mutasi Siswa Masuk"
  "Mutasi Siswa Keluar"
  "Pelayanan Surat Keterangan Siswa"
  "Pelayanan Legalisir Ijazah"
  "Pelayanan Legalisir Rapor"
  "Pengelolaan Perpustakaan"
  "Peminjaman Buku Perpustakaan"
  "Pelayanan Laboratorium IPA"
  "Pelayanan Laboratorium Komputer"
  "Penilaian Hasil Belajar"
  "Asesmen Madrasah"
  "Pengajuan Cuti Pegawai"
  "Kenaikan Pangkat"
  "Penilaian Kinerja Pegawai (SKP)"
  "Pengusulan Satya Lencana"
  "Penerbitan SK Tugas Tambahan"
  "Presensi/Absensi Pegawai"
  "Mutasi Pegawai"
  "Pengelolaan Keuangan Madrasah"
  "Perencanaan Anggaran (RKAS)"
  "Pencairan Dana"
  "Pertanggungjawaban Keuangan"
  "Honorarium Pegawai"
  "Pengadaan Barang/Jasa"
  "Pengelolaan BMN/Aset"
  "Inventarisasi Barang"
  "Peminjaman Ruangan"
  "Pemeliharaan Gedung dan Fasilitas"
  "Penghapusan Barang"
  "Pengaduan Masyarakat"
  "Pelayanan Informasi Publik"
  "Kegiatan Kemitraan"
  "Publikasi Kegiatan Madrasah"
  "Sistem Dokumentasi dan Kearsipan"
  "Pengelolaan Surat Masuk"
  "Pengelolaan Surat Keluar"
  "Penomoran Surat"
  "Pelayanan Tamu"
)

slugify() {
  local s="$1"
  s="$(echo "$s" | tr '[:upper:]' '[:lower:]')"          # lowercase
  s="$(echo "$s" | sed 's/[()\/]//g')"                   # remove () and /
  s="$(echo "$s" | sed 's/[^a-z0-9]\+/-/g')"             # non-alphanumeric -> -
  s="$(echo "$s" | sed 's/-\{2,\}/-/g')"                 # collapse multiple -
  s="$(echo "$s" | sed 's/^-//; s/-$//')"                # trim leading/trailing -
  echo "$s.md"
}

for t in "${titles[@]}"; do
  filename="$(slugify "$t")"
  filepath="$OUTPUT_DIR/$filename"
  echo "<!-- TODO: $filename -->" > "$filepath"
  echo "Created: $filepath"
done

echo "All files created in: $OUTPUT_DIR"
