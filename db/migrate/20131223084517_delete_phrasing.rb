class DeletePhrasing < ActiveRecord::Migration
  def change
    drop_table :phrasing_phrases, :phrasing_phrase_versions
  end
end
