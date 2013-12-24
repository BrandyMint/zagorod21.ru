class Cora::Repository

  def get key, default=nil
    get_phrase(key).try :value
  end

  def get_or_create key, default=nil
    phrase = get_phrase(key) || Cora::Phrase.create(key: key, locale: locale, value: default || key)

    phrase.value
  end

  def get_phrase key
    Cora::Phrase.where(key: key, locale: locale).first
  end

  private

  def locale
    I18n.locale
  end
end
