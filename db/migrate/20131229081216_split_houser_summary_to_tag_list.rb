class SplitHouserSummaryToTagList < ActiveRecord::Migration
  def change
    House.where("summary <> ''").each do |house|
      tag_list = house.summary.gsub(%r{</?[^>]+?>}, '').delete(",.:;|?±§`~{}[]=+-_?$#@!^&*()\\\"").split(%r{\s}).select{|w| w.size > 3}.join(",").downcase
      house.tag_list = tag_list
      house.save
    end
  end
end
