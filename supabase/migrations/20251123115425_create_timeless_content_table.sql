/*
  # Buat Tabel Timeless Content
  
  Tabel untuk menyimpan konten undangan tema Timeless yang bisa diedit via admin panel.
  
  1. Tabel Baru
    - `timeless_content`
      - `id` (uuid, primary key)
      - `couple_names` (text) - Nama pasangan
      - `groom_full_name` (text) - Nama lengkap mempelai pria
      - `bride_full_name` (text) - Nama lengkap mempelai wanita
      - `wedding_title` (text) - Judul undangan
      - `wedding_date` (text) - Tanggal pernikahan
      - `venue_name` (text) - Nama tempat
      - `venue_address` (text) - Alamat lengkap
      - `venue_maps` (text) - Link Google Maps
      - `ceremony_time` (text) - Waktu pemberkatan
      - `reception_time` (text) - Waktu resepsi
      - `background_image` (text) - URL gambar background
      - `groom_photo` (text) - URL foto mempelai pria
      - `bride_photo` (text) - URL foto mempelai wanita
      - `thank_you_message` (text) - Pesan terima kasih
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)
  
  2. Security
    - Enable RLS pada tabel
    - Public bisa READ (untuk tampilan undangan)
    - Siapa saja bisa INSERT/UPDATE (untuk demo, nanti bisa ditambah auth)
*/

CREATE TABLE IF NOT EXISTS timeless_content (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  couple_names text DEFAULT '',
  groom_full_name text DEFAULT '',
  bride_full_name text DEFAULT '',
  wedding_title text DEFAULT '',
  wedding_date text DEFAULT '',
  venue_name text DEFAULT '',
  venue_address text DEFAULT '',
  venue_maps text DEFAULT '',
  ceremony_time text DEFAULT '',
  reception_time text DEFAULT '',
  background_image text DEFAULT '',
  groom_photo text DEFAULT '',
  bride_photo text DEFAULT '',
  thank_you_message text DEFAULT '',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE timeless_content ENABLE ROW LEVEL SECURITY;

-- Policy untuk READ - siapa saja bisa baca
CREATE POLICY "Anyone can read timeless content"
  ON timeless_content
  FOR SELECT
  USING (true);

-- Policy untuk INSERT - siapa saja bisa tambah (untuk demo)
CREATE POLICY "Anyone can insert timeless content"
  ON timeless_content
  FOR INSERT
  WITH CHECK (true);

-- Policy untuk UPDATE - siapa saja bisa update (untuk demo)
CREATE POLICY "Anyone can update timeless content"
  ON timeless_content
  FOR UPDATE
  USING (true)
  WITH CHECK (true);
