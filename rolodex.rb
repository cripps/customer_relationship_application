class Rolodex
  def initialize
    @contacts = []
    @id = 1
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id
    end
  end

  def modify_contact
  end

  def contacts
    @contacts
  end

  def delete(contact_id)
    @contacts.delete_if do |contact|
      contact.id == contact_id
    end
  end

  def display_attribute(attribute_name)
    @contacts.map do |contact|
      contact.send(attribute_name)
    end
  end
end