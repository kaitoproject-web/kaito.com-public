/*
  # Add livestreaming image field

  1. Changes
    - Add `livestreaming_image` column to store the livestreaming section image URL
    - This allows admin to change the couple photo in the livestreaming section

  2. Notes
    - Field is optional (nullable)
    - Stores full URL path to the image
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'timeless_content' AND column_name = 'livestreaming_image'
  ) THEN
    ALTER TABLE timeless_content ADD COLUMN livestreaming_image text;
    COMMENT ON COLUMN timeless_content.livestreaming_image IS 'URL for the livestreaming section couple image';
  END IF;
END $$;