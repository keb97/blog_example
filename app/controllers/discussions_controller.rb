class DiscussionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /discussions
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1
  def show
  end

  # GET /discussions/new
  def new
    @discussion = current_user.discussions.build
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  def create
    @discussion = current_user.discussions.build(discussion_params)

    if @discussion.save
      redirect_to @discussion, notice: 'Discussion was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /discussions/1
  def update
    if @discussion.update(discussion_params)
      redirect_to @discussion, notice: 'Discussion was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /discussions/1
  def destroy
    @discussion.destroy
    redirect_to discussions_url, notice: 'Discussion was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Checks if the user is authorized to perform tha action
    def correct_user
      @discussion = current_user.discussions.find_by_id(params[:id])
      redirect_to discussions_path, noitce: 'Not authorized to change this Discussion' if @discussion.nil?
    end  

    # Only allow a trusted parameter "white list" through.
    def discussion_params
      params.require(:discussion).permit(:comment, :user_id, :article_id)
    end
end
