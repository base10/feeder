module Features
  def have_notice(text)
    have_data_role(role: "flash-notice", text: text)
  end
end
