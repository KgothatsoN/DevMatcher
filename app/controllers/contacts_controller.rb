class ContactsController < ApplicationController
  def new
    #Instance variable connected to new contact form
    @contact = Contact.new
  end
  
  def create
    #Save contact form with details to @contact {name: 'john', email: 'email@email.com' etc}
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "Message Sent."
    else
      redirect_to new_contact_path, notice: "Error!"
    end
  end
  
  #Security method, strong parameters
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end