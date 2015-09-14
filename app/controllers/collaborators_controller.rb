class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(user: @user, wiki: @wiki)
    @collaborator.save
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki
    email = @collaborator.user_email

    if @collaborator.destroy
      flash[:notice] = "\"#{email}\" was successfully removed from the Wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error removing collaborator."
      redirect_to edit_wiki_path(@wiki)
    end
  end


  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end

end
