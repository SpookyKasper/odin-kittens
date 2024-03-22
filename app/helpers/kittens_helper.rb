module KittensHelper

  def delete_kitten_button(kitten)
    button_to "Delete #{kitten.name}", kitten_path(kitten), method: :delete
  end
end
