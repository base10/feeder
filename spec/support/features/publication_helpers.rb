module Features
  def have_publication(publication)
    have_data_role(role: "publication-name", text: publication)
  end
end
