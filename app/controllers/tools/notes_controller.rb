class Tools::NotesController < ApplicationController
    before_action :find_note, only: [:show, :edit, :update, :destroy]

        def index
    		@tools_note = Tools::Note.where(user_id: current_user.id)
    	end

    	def show
    	end

    	def new
    		@tools_note = Tools::Note.new
    	end

    	def create
            @tools_note = Tools::Note.new(tools_note_params)

    		if @tools_note.save
                redirect_to @tools_note
    		else
    			render 'new'
    		end
    	end


    	def edit
    	end

    	def update
    		if @tools_note.update(tools_note_params)
                redirect_to @tools_note
    		else
    			render 'edit'
    		end
    	end

    	def destroy
    		@tools_note.destroy
            redirect_to tools_notes_path

        end


    	private

    	def find_note
    		@tools_note = Tools::Note.find(params[:id])
    	end

    	def tools_note_params
    		params.require(:tools_note).permit(:title, :content)
    	end

end
