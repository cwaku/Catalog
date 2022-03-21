class Item
  def intialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
