class FormObjectBase < Hashie::Dash
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveRecord::Callbacks

  def persisted?
    false
  end

  def to_key
    nil
  end

  private

  def nilify_blanks(options={})
    keys = options[:only] ||= self.keys
    keys.each do |key|
      self[key] = nil if self[key].blank?
    end
  end

end
