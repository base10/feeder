module Features
  def have_message(message)
    have_css("[data-role='feedback']", text: message)
  end
end
