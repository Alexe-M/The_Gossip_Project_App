class JoinGossipsTags < ActiveRecord::Migration[7.2]
  def change
    create_table :gossips_tags, id: false do |t|
      t.belongs_to :gossip, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true
    end
  end
end
