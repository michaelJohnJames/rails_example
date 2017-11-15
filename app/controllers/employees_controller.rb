class EmployeesController < ApplicationController

  #GET 'employees'
  def index
    @employees = Employee.all
  end


#GET '/employees/new'
  def new
    @employee = Employee.new
  end

#POST '/employees'
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      #yay redirect
      redirect_to @employee, notice: "You did it!"
    else
      #womp error time
      render :new
    end

  end

#GET '/employees/:id'
  def show
    @employee = Employee.find_by_id(params[:id])
  end

  def edit
    @employee = Employee.find_by_id(params[:id])
  end

  def update
    @employee = Employee.find_by_id(params[:id])
    if @employee.update(employee_params)
      redirect_to employee_path(@employee), notice: "Successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find_by_id(params[:id])
    @employee.destroy
    redirect_to employees_path, notice: "Successfully deleted employee."
  end




  private

def employee_params
  params.require(:employee).permit(:name, :title)
end


end
