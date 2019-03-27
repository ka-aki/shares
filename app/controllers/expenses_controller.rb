class ExpensesController < ApplicationController
  
  before_action :authenticate_user, {only: [:index]}   

  def index
    @expense = Expense.new
    @expenses = Expense.all

    @group = GroupUser.find_by(user_id: @current_user.id)
    @group_id = @group.group_id 

    total = Expense.where(label: "総計", group_id: @group_id).pluck(:month, :price)
    @labels = total.map(&:first)
    @datas  = total.map(&:second)

  end
  def food
    @expense = Expense.new
    @expenses = Expense.all

    @group = GroupUser.find_by(user_id: @current_user.id)
    @group_id = @group.group_id 

    @foodexpenses = Expense.where(label: "食費")

    food = Expense.where(label: "食費", group_id: @group_id).pluck(:month, :price)
    @labels = food.map(&:first)
    @datas  = food.map(&:second)

  end

  def commodity
    @expense = Expense.new
    @expenses = Expense.all

    @group = GroupUser.find_by(user_id: @current_user.id)
    @group_id = @group.group_id 

    @commodityexpenses = Expense.where(label: "日用品")

    commodity = Expense.where(label: "日用品", group_id: @group_id).pluck(:month, :price)
    @labels = commodity.map(&:first)
    @datas  = commodity.map(&:second)

  end
  def utility
    @expense = Expense.new
    @expenses = Expense.all

    @group = GroupUser.find_by(user_id: @current_user.id)
    @group_id = @group.group_id 

    @utilityexpenses = Expense.where(label: "光熱費")

    utility = Expense.where(label: "光熱費", group_id: @group_id).pluck(:month, :price)
    @labels = utility.map(&:first)
    @datas  = utility.map(&:second)

  end
  def water
    @expense = Expense.new
    @expenses = Expense.all

    @group = GroupUser.find_by(user_id: @current_user.id)
    @group_id = @group.group_id 

    @waterexpenses = Expense.where(label: "水道代")

    water = Expense.where(label: "水道代", group_id: @group_id).pluck(:month, :price)
    @labels = water.map(&:first)
    @datas  = water.map(&:second)

  end

  def create
    @a = GroupUser.find_by(user_id: @current_user.id)
    @b = @a.group_id

    @expense = Expense.new(month: params[:expense][:month], label: params[:expense][:label], price: params[:expense][:price], user_id: @current_user.id, group_id: @b )
    @expense.save
    redirect_to("/expenses")
  end

  def edit
    @expense = Expense.find_by(id: params[:id])
  end

  def update
    @expense = Expense.find_by(id: params[:id])
    @expense.update_attributes(month: params[:month], label: params[:label], price: params[:expense][:price])
    redirect_to("/expenses")
  end

  def destroy
    @expense = Expense.find_by(id: params[:id])
    @expense.destroy
    redirect_to("/expenses")
  end
end
