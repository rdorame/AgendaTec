class Evento < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :nombre_evento, presence: true, length: { maximum: 50 }
  validates :descripcion, presence: true, length: { maximum: 140 }
  validate  :picture_size
  validates  :categorias, presence: true

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Debe pesar menos de 5MB")
      end
    end
end
