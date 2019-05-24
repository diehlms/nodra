class EventsController < ApplicationController
    
    helper_method :current_user, :logged_in?

    def new
        @event = current_user.events.build
    end

    def index
        @event = Event.all
    end
    
    def show
        set_event
    end

    def create
        @event = current_user.events.new(event_params)
        if @event.save
            flash[:notice] = "Event added"
            redirect_to events_path
        else 
            render 'new'
        end
    end

    def destroy
        set_event
        @event = current_user.events.find(params[:id])
        if @event.destroy
            flash[:notice] = "Event was deleted"
            redirect_to root_url
        else
            redirect_to events_edit
        end

    end

    def update
        @event = current_user.events.find(params[:id])
        if @event.update(event_params)
            flash[:notice] = "Event was updated"
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def edit
        set_event
    end

    private

        def event_params
            params.require(:event).permit(:event_title, :event_content, :date_from, :date_to)
        end

        def set_event
            @event = Event.find(params[:id])
        end

end
