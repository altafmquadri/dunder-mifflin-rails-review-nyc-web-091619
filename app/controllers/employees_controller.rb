class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id))
        @employee.save
        redirect_to employees_path
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id))
        redirect_to employee_path(@employee)
    end
end
