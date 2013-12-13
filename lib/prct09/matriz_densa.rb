require 'prct09/matriz.rb'

# = matriz_densa.rb
#
# Autor:: Ivan Cabaleiro Escuderos.
# Autor:: Maurizio A. Rendon Mattogno.
# Web:: https://github.com/alu0100611724/prct11.git
#
#
# == Clase Matriz_densa
#
# Clase concreta de la clase Matriz para el uso de las matrices densas.
#
# * max ()
# * min ()
class Matriz_densa < Matriz
	#Variable que contiene los valores de la matriz
	attr_accessor :m
	#Recibe una matriz, la almacena en @m y llama a super con los valores de fila y columna
        def initialize (matriz)
               raise ArgumentError, 'El parametro debe ser una matriz' unless matriz.is_a? Array
               @m = matriz
		super(matriz.length, matriz[0].length)
        end

	#Busca el elemento mayor de la matriz densa 
	def max
		max = @m[0][0]
		for i in 0...@fi 
			for k in 0...@co
				if (@m[i][k] > max) then
					max=@m[i][k] 
				end
			end
		end
		max
	end

	#Busca el menor elemento dentro de la matriz densa
	def min
                min = @m[0][0]
                for i in 0...fi
                        for k in 0...co
                                if @m[i][k] < min then
                                        min=@m[i][k]
                                end
                        end
                end     
                min
        end

end
