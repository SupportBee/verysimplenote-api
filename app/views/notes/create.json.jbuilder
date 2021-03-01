json.note do
  json.id @note.id

  json.content do
    json.text @note.content.text
  end
end
