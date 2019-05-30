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
            flash[:notice] = "Contact added"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def update
        set_contact
        @contact = current_user.contacts.find(params[:id])
        if @contact.update(contacts_params)
            flash[:notice] = "Contact was updated"
            redirect_to contact_path(@contact)
        else
            flash[:notice] = "Contact was not updated"
            render 'edit'
        end
    end

    def show
        set_contact
    end

    def destroy
        set_contact
        if @contact.destroy
            flash[:notice] = "Contact was deleted"
            redirect_to contacts_path
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