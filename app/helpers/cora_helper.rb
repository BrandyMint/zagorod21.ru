module CoraHelper
  def cora_available_locales
    [:en, :ru]
  end

  def phrase key, opts={}
    value = phrase_get(key, opts[:default]) || I18n.t(key, scope: 'cora.phrases') || key.to_s
    key
  end

  def phrase_get key, opts={}
    opts||={}
    if Cora.config.autocreate
      Cora.repository.get_or_create key, opts[:default]
    else
      Cora.repository.get( key ) || opts[:default]
    end
  end

  def can_edit_phrases?
    current_admin_user.present?
  end
end
