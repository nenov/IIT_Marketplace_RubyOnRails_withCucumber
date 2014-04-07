class AddAttachmentAdvertphotoToAdverts < ActiveRecord::Migration
  def self.up
    change_table :adverts do |t|
      t.has_attached_file :advertphoto
    end
  end

  def self.down
    drop_attached_file :adverts, :advertphoto
  end
end
