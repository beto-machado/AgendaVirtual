# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts.all
  end

  def new
    @contact = current_user.contacts.new
  end

  def edit; end

  def create
    @contact = current_user.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Contato criado com sucesso.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: 'Contato atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_path, notice: 'Contato apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address)
  end
end
