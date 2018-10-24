class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all

    search_term = params[:search]
    if search_term
      @contacts = @contacts.where("first_name ILIKE ?", "%#{search_term}%")
      # @contacts = @contacts.where("last_name ILIKE ?", "%#{search_term}%")
      # @contacts = @contacts.where("email ILIKE ?", "%#{search_term}%")
      # @contacts = @contacts.where("phone_number ILIKE ?", "%#{search_term}%")
    end

    render "index.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
      middle_name: params["middle_name"],
      bio: params["bio"]
      )
    @contact.save
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params["first_name"] || @contact.first_name
    @contact.last_name = params["last_name"] || @contact.last_name
    @contact.email = params["email"] || @contact.email
    @contact.phone_number = params["phone_number"] || @contact.phone_number
    @contact.middle_name = params["middle_name"] || @contact.middle_name
    @contact.bio = params["bio"] || @contact.bio
    @contact.save
    render "show.json.jbuilder"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "successfully destroyed, playa"}
  end

end
