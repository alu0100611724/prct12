# = matriz.rb
#
# Autor:: Ivan Cabaleiro Escuderos.
# Autor:: Maurizio A. Rendon Mattogno.
# Web:: https://github.com/alu0100611724/prct11.git
#
#
# == Clase Matriz
#
# Clase general para el uso de las matrices
# * mostrar ()
# * '[]' (n)
# * Operadores +,-,*
class Matriz
	#Variable con el numero de filas
	attr_accessor :fi
	#Variable con el numero de columnas 
	attr_accessor :co
	
	#Recibe el numero de filas y columnas de la matriz
	def initialize (fi, co)
		raise ArgumentError, 'El parametro debe ser entero' unless fi.is_a? Integer
		raise ArgumentError, 'El parametro debe ser entero' unless co.is_a? Integer
		@fi = fi
		@co = co
	end

	#Metodo de instancia to_s
	def mostrar()
		texto=""
		for i in 0...@fi do
			if (i>0) then
				texto += "\n"
			end
			for k in 0...@co do
				texto += "#{@m[i][k]} "
			end
		end
		texto
	end

	#Metodo para acceder a la posicion del array indicado por el indice
	def [](n)
		raise ArgumentError, "El parametro debe ser entero" unless n.is_a? Integer
		if (n>=0) then
			return @m[n]
		else
			return nil
		end
	end

	#Operador suma
	def +(o)
		@fi.times do |i|
      			 @co.times do |j|
        			@m[i][j] = @m[i][j] + o[i][j]
      			end
    		end
		return @m
	end

	#Operador resta
        def -(o)
                @result = @m
		@fi.times do |i|
      		 	@co.times do |k|
                                @result[i][k] = @m[i][k] - o[i][k]
                        end
                end
                return @result
        end

	#Operador multiplicacion
	def *(o)
		tam = @m.length
		@result = Array.new(tam, Array.new(tam ,0))
		@fi.times do |i|
      			 @co.times do |j|	
				@fi.times do |k|
         				@result[i][j] += @m[i][k]*o[k][j]
        			end
    			end
  		end 
		return @result
	end
end

