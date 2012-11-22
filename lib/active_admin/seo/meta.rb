class ActiveAdmin::Seo::Meta < ActiveRecord::Base
  self.table_name = "active_admin_seo_meta"
  belongs_to :seoable, :polymorphic => true
  attr_accessible :slug, :title, :description, :keywords,
                  :og_title, :og_type, :og_url

  image_accessor :og_image
  attr_accessible :og_image, :og_image_url, :retained_og_image, :remove_og_image

  validates_size_of :og_image, :maximum => 3.megabyte
  validates_property :format, :of => :og_image, :in => [:jpeg, :jpg, :png], :case_sensitive => false

  validates :title, :description, :keywords, :length => { :maximum => 160 }
end
