class ContactsController < ApplicationController
    helper_method :current_user, :logged_in?
    
    def new
        @contact = Contact.new
    end

    def index
        @contacts = Contact.all
    end

    def edit
        set_contact
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to root_path, notice: "Contact added"
        else
            render 'new'
        end
    end

    def update
        set_contact
        @contact = current_user.contacts.find(params[:id])
        if @contact.update(contacts_params)
            redirect_to contact_path(@contact), notice: "Contact was updated"
        else
            render 'edit', notice: "Contact was not updated"
        end
    end

    def show
        set_contact
    end

    def destroy
        set_contact
        if @contact.destroy
            redirect_to contacts_path, notice: "Contact was deleted"
        else
            redirect_to contacts_edit
        end
    end

    private

        def contact_params
            params.require(:contact).permit(:name, :fleet, :email, :phone_number)
        end

        def set_contact
            @contact = Contact.find(params[:id])
        end
end