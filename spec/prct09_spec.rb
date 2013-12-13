require 'rspec'
require 'prct09/racional.rb'
require 'prct09/matriz.rb'
require 'prct09/matriz_dispersa.rb'
require 'prct09/matriz_densa.rb'

describe Matriz do
	before :each do
		#Inicializar variables
		@mden = Matriz_densa.new([[0,1,2],[1,2,3],[3,4,5]])
		@mdis = Matriz_dispersa.new 0 => {0 => 1}, 1 => {1 => 2}, 2 => {2 => 3} #Diagonal de 1
		@mod1 = Matriz_dispersa.new 0=> {0 => 1}, 1 => {1 => Racional.new(1,2)}, 2 => {2 => 3}
		@mod2 = Matriz_densa.new([[0,1,2],[1,2,3],[3,4,Racional.new(1,2)]])
	end
	#Modificacion

	it "Se deben restar matrices con racionales" do
		(@mod1-@mod2).should == [[1, -1, -2], [-1, Racional.new(-3,2) , -3], [-3, -4, Racional.new(5, 2)]]
	end
	#Sentencias it
	it "Se debe almacenar una matriz densa" do
		@mden.class.should == Matriz_densa
	end
	it "Se debe almacenar una matriz dispersa" do
		@mdis.class.should == Matriz_dispersa
	end
	it "Se deben calcular bien el numero de filas y columnas para dispersas" do
		@mdis.fi.should == 3
		@mdis.co.should == 3
	end
	it "Se debe acceder a una posicion de la matriz dispersa" do
		@mdis[0][0].should == 1
	end

	it "Se debe calcular el valor maximo de una matriz densa" do
		@mden.max.should == 5
	end

	it "Se debe calcular el valor maximo de una matriz dispersa" do
                @mdis.max.should == 3
        end

	it "Se debe calcular el valor minimo de una matriz densa" do
                @mden.min.should == 0
        end

        it "Se debe calcular el valor minimo de una matriz dispersa" do
                @mdis.min.should == 1
        end
	
	it "Se deben mostrar las matrices densas" do
		@mden.mostrar.should == "0 1 2 \n1 2 3 \n3 4 5 "
	end 
	it "Se deben mostrar matrices dispersas" do
		@mdis.mostrar.should == "1 0 0 \n0 2 0 \n0 0 3 "
	end
	
	it "Se deben sumar dos matrices dispersas" do
    (@mdis+@mdis).should == [[2, 0, 0], [0, 4, 0], [0, 0, 6]]
  end
	it "Se deben restar" do
		(@mdis-@mdis).should == [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
	end
	
	it "Se deben sumar dos matrices densas" do
		(@mden+@mden).should == [[0, 2, 4],[2, 4, 6],[6, 8, 10]]
	end
	it "Se deben multiplicar" do
		(@mdis*@mdis).should == [[1, 4, 9], [1, 4, 9], [1, 4, 9]]
		(@mdis*@mden).should == [[11, 17, 23], [11, 17, 23], [11, 17, 23]]
		(@mden*@mdis).should == [[4, 14, 30], [4, 14, 30], [4, 14, 30]]
	end

	it "Se deben multiplicar" do
		(@mdis+@mdis).should == [[2, 0, 0], [0, 4, 0], [0, 0, 6]]
	end


end
