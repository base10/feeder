module Features
  def have_feedback(message)
    have_data_role(role: "feedback", text: message)
  end

  def have_data_role(role:, text:)
    have_css("[data-role='#{role}']", text: text)
  end
end
