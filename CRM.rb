require_relative "rolodex.rb"
require_relative "contact.rb"

class CRM
  def self.run
    my_crm = CRM.new
    my_crm.main_menu
  end

  def initialize
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "--------------------------------"
    puts "~~~~~~~WELCOME TO THE CRM~~~~~~~"
    puts "--------------------------------"
    puts "[1] Add new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display a contact"
    puts "[5] Display an attribute"
    puts "[6] Display all contacts"
    puts "[7] Exit"
    puts "--------------------------------"
    puts "Please enter a selection (1-7)"
  end

  def call_selection(selection)
    add_new_contact if selection == 1
    modify_contact if selection == 2
    delete_contact if selection == 3
    display_contact if selection == 4
    display_by_attribute if selection == 5
    display_all if selection == 6
    exit if selection == 7
  end

  def main_menu
    while true
      print_main_menu
      selection = gets.chomp.to_i
      call_selection(selection)
    end
  end

  def add_new_contact
    print "First name:"
    first_name = gets.chomp
    print "Last name:"
    last_name = gets.chomp
    print "Email:"
    email = gets.chomp
    print "Note:"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(contact)
  end

  def display_contact
    print "Enter id of user you would like to view:"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts contact
  end

  def modify_contact
    print "Enter id of user you would like to modify:"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts "Please verify if you would like the contact for #{contact} by typing 'yes' or 'no'."
    modify_response = gets.chomp.downcase
    if modify_response == "yes"
      print "First name:"
      contact.first_name = gets.chomp
      print "Last name:"
      contact.last_name = gets.chomp
      print "Email:"
      contact.email = gets.chomp
      print "Note:"
      contact.note = gets.chomp
      print "CONTACT MODIFIED SUCCESSFULLY"
    end
  end

  def delete_contact
    print "Enter id of user you would like to delete:"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts "Please verify if you would like to delete the contact information for #{contact} by typing 'yes' or 'no'."
    delete_response = gets.chomp.downcase
    if delete_response == "yes"
      @rolodex.delete(contact_id)
    end
  end

  def display_all
    puts @rolodex.contacts
  end

  def display_by_attribute
    puts "-------------------------------"
    puts "~~~~~~~~~~ATTRIBUTES~~~~~~~~~~~"
    puts "-------------------------------"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"
    puts "Please enter the a selection (1-4)"

    attribute_id = gets.chomp.to_i

    option_map = {
      1 => "first_name",
      2 => "last_name",
      3 => "email",
      4 => "note",
    }

    if attribute_name = option_map[attribute_id]
      puts @rolodex.display_attribute(attribute_name)
    else
      puts "Invalid option"
    end
    # if attribute_id == 1
    #   @contacts.each do |contact|
    #   print contact[0]
    #   end
    # elsif attribute_id == 2
    #   @contacts.each do |contact|
    #   print contact[1]
    #   end
    # elsif attribute_id == 3
    #   @contacts.each do |contact|
    #   print contact[2]
    #   end
    # elsif attribute_id == 4
    #   @contacts.each do |contact|
    #   print contact[3]
    #   end
  end


end

CRM.run