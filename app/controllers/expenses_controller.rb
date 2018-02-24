class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]

  def index
     @expenses = Expense.order("date DESC") # ordenar por fecha descendente en la tabla de la base de datos
     if params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%") # el where busca es igual que el find el ILIKE para ignorar mayúsculas y minúsculas, busca texto
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id]) #busca el id
    end
  end

  def new
    
  end

end

# el = y el ILIKE son operadores
