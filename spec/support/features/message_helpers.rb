module Features
  def have_feedback(message)
    have_css("[data-role='feedback']", text: message)
  end
end
