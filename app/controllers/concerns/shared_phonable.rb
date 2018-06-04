module SharedPhonable
  def phone=(phone_string)
    return if phone_string.blank?
    self[:phone] = phone_string.gsub(/\D/, '')
  end

  def pretty_phone
    return if phone.blank?
    phone.insert(0, '(').insert(4, ') ').insert(9, '-')
  end
end