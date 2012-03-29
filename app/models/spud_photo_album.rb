class SpudPhotoAlbum < ActiveRecord::Base
  has_and_belongs_to_many :galleries,
    :class_name => 'SpudPhotoGallery',
    :join_table => 'spud_photo_galleries_albums'
  has_and_belongs_to_many :photos,
    :class_name => 'SpudPhoto',
    :join_table => 'spud_photo_albums_photos',
    :order => 'created_at'
  validates_presence_of :title
  validates_uniqueness_of :title

  def top_photo_url(style)
    unless photos.empty?
      return photos.first.photo.url(style)
    end
  end

  def photos_available
    if photo_ids.any?
      return SpudPhoto.where('id not in (?)', photo_ids)
    else
      return SpudPhoto.all
    end
  end
end