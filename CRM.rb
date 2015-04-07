# require_relative "contact.rb"
# require_relative "rolodex.rb"

class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def to_s
    print "First Name: #{@first_name}"
    print "Last Name: #{@last_name}"
    print "Email: #{@email}"
    print "Note: #{@note}"
  end
end

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

  def display_contact(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id
    end
  end

  def modify_contact
  end

  def display_all_contacts
  end

  def delete_contact_
  end

  def display_atrribute
  end
end

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
    puts "[6] Exit"
    puts "--------------------------------"
    puts "Please enter a selection (1-6)"
  end

  def call_selection(selection)
    add_new_contact if selection == 1
    modify_contact if selection == 2
    delete_contact if selection == 3
    display_contact if selection == 4
    display_by_attribute if selection == 5
    exit if selection == 6
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
    end
  end
end

CRM.run