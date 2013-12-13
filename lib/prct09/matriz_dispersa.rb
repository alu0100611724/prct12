require 'prct09/matriz.rb'

# = matriz_dispersa.rb
#
# Autor:: Ivan Cabaleiro Escuderos.
# Autor:: Maurizio A. Rendon Mattogno.
# Web:: https://github.com/alu0100611724/prct11.git
#
#
# == Clase SpareVector
#
# Clase que contiene un hash.
# * '[]' (i)
# * to_s ()
# * keys ()
class SparseVector 
  attr_accessor :vector

  def initialize(h = {})
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  #Acceso a la posicion i del hash
  def [](i)
    if  @vector[i].class == nil.class
	0
    else
	@vector[i]
    end 
  end

  def to_s
    @vector.to_s
  end

  #Retorna las llaves de acceso del hash
  def keys
    @vector.keys
  end
end

#
# == Clase Matriz_dispersa
#
# Clase concreta de Matriz para el uso de las matrices dispersas (mas de un 60% de ceros).
# * '[]' (i)
# * max ()
# * min ()
# * to_den ()
# * Operadores +,-,*
class Matriz_dispersa < Matriz
  #Variable con los indices hash y sus valores asociados
  attr_accessor :m
  
  #Recibe un hash y lo almacena en nuestra estructura, llama a super con el valor maximo de fila y columna	
  def initialize(h = {})
    fi,co= 0,0
    @m = Hash.new({})
    for k in h.keys do
      if (k>fi) then fi=k end 
      @m[k] = if h[k].is_a? SparseVector
                     h[k]
                   else 
                     @m[k] = SparseVector.new(h[k])
                   end
      for j in h[k].keys do
	if (j>co) then co=j end
      end
    end
    super(fi+1, co+1)
  end

  #Acceso al elemento i
  def [](i)
    if @m[i].class == SparseVector then
	@m[i]
    else
	0
    end
  end

  #Calcula el elemento maximo, optimizado para Matriz_dispersa
  def max
    max = @m[0][0]
    for i in @m.keys do
	for j in @m[i].keys do
	    if (@m[i][j] > max) then
      		max = @m[i][j] 
	    end
	end
    end
    max
   end

   #Calcula el menor elemento, optimizado para Matriz_dispersa
   def min
    min = @m[0][0]
    for i in @m.keys do
        for j in @m[i].keys do
            if (@m[i][j] < min) then
                min = @m[i][j]       
            end
        end
    end
    min
   end
	 def m
		return @m
	 end

	 #Convierte una matriz dispersa a densa.
	 def to_den
			a = Array.new(@fi)
			for i in 0...@fi
				b = Array.new(@co)
				for j in 0...@co
					b[j]	= @m[i][j]
				end
				a[i] = b
			end
			return Matriz_densa.new(a)
	 end
	 #Operador resta optimizado para matrices dispersas, si el argumento no es Matriz_dispersa convierte la dispersa en densa y llama al operador de la superclase
	 def -(o)
		a = self.to_den
		if o.class == Matriz_dispersa then
    	for i in o.m.keys do
        	for j in o.m[i].keys do
          	a[i][j] = a[i][j] - o[i][j]
        	end
      	end
    	return a.m
		else
			a-o
		end
	end
#Operador suma optimizado para matrices dispersas, si el argumento no es Matriz_dispersa convierte la dispersa en densa y llama al operador de la superclase
  def +(o)
    a = self.to_den
    if o.class == Matriz_dispersa then
      for i in o.m.keys do
          for j in o.m[i].keys do
            a[i][j] = a[i][j] + o[i][j]
          end
        end	
      return a.m
    else
      a+o
    end
  end
	#Convierte la matriz en densa y llama al operador de la superclase
	def *(o)
		a = self.to_den
		if o.class == Matriz_dispersa then
			return a * o.to_den
		else
			return a * o
		end
	end


end
