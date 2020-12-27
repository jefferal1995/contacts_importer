class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts.includes(:phones, :addresses, :credit_cards).order(created_at: :desc)
  end

end
