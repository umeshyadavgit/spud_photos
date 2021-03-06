require 'spud_core'
require 'paperclip'

module Spud
  module Photos
    class Engine < Rails::Engine
      engine_name :spud_photos
      initializer :assets_photos do |config| 
        Rails.application.config.assets.precompile += ["spud/admin/photos*"]
      end
      initializer :admin_photos do
        Spud::Core.config.admin_applications += [{
          :name => 'Photo Albums',
          :thumbnail => 'spud/photos/photo_albums_thumb.png',
          :url => '/spud/admin/photo_albums',
          :retina => true,
          :order => 82
        # },{
        #   :name => 'Photos',
        #   :thumbnail => 'spud/photos/photo_albums_thumb.png',
        #   :url => '/spud/admin/photos',
        #   :retina => true,
        #   :order => 83
        }]
        if Spud::Photos.config.galleries_enabled
          Spud::Core.config.admin_applications += [{
            :name => 'Photo Galleries',
            :thumbnail => 'spud/photos/photo_albums_thumb.png',
            :url => '/spud/admin/photo_galleries',
            :retina => true,
            :order => 81
          }]
        end
      end
    end
  end
end