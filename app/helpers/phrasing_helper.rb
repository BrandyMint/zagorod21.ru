module PhrasingHelper
  def can_edit_phrases?
    current_admin_user.present?
  end
end
