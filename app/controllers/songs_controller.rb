class SongsController < ApplicationController

    def new
        @song = Song.new 
    end 

    def edit 
        @song = Song.find(params[:id])
    end 

    def create
        @song = Song.new(song_attributes)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else 
            render :new
        end 
    end 

    def update 
        @song = Song.find(params[:id])
        @song.update(song_attributes)
        if @song.valid?
            redirect_to song_path(@song)
        else 
            render :edit 
        end 
    end 

    def index 
        @songs = Song.all
    end 
    
    
    def show 
        @song = Song.find(params[:id])
    end 

    def destroy 
        @song =  Song.find(params[:id])
        @song.destroy
        redirect_to songs_path 
    end 


    private

       def song_attributes
            params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
       end 

end
