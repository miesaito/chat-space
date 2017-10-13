class GroupsController < ApplicationController
  def show
    @groups = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    # binding.pry
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

private
 def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
