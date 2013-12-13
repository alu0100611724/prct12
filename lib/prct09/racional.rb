require "prct09/gcd.rb"

# = racional.rb
#
# Autor:: Ivan Cabaleiro Escuderos.
# Autor:: Maurizio A. Rendon Mattogno.
# Web:: https://github.com/alu0100611724/prct11.git
#
#
# == Clase Racional
#
# Clase que permite trabajar matrices con numeros racionales
# * num ()
# * denom()
# * coerce ()
# * to_s ()
# * to_f ()
# * abs ()
# * reciprocal ()
# * operadores +,-,*,/,%,==,<=>
# * eql? (o)
class Racional

  attr_writer :num #numerador
  attr_writer :den #denominador

  include Comparable

  def initialize(num, den)
    #Comprobacion de datos introducidos
    raise ArgumentError, 'El denominador no puede ser cero' unless den != 0
    raise ArgumentError, 'El denominador no es numerico' unless den.is_a? Numeric
    raise ArgumentError, 'El numerador no es numerico' unless num.is_a? Numeric
     	        mcd = gcd(num, den)
                @num = num/mcd
                @den = den/mcd
  end

	#Metodo que facilita la operaciones entre objetos Numeric y Racional
	def coerce(o)
		if o.is_a? Numeric  then n = Racional.new(o, 1) end
		return [n, self]
	end

	#Devuelve el numerador @num
	def num()
		@num
	end
	
	#Devuelve el denominador @den
	def denom()
		@den
	end

	#Devuelve una cadena de la forma "1/2"
	def to_s()
		"#@num/#@den"
	end

	#Devuelve el resultado de la división en flotante
	def to_f()
		num =  @num.to_f
		num / @den	
	end
	
	#Cambia la fracción por su valor absoluto
	def abs()
		if @num < 0
			@num = @num*-1
		end
		if @den < 0
			@den = @den*-1
		end
	end

	#Cambia la fracción por su recíproca
	def reciprocal()
		Racional.new(@den, @num)
	end

	#Sobrecarga del operador == para que compare el objeto que invoca con el parametrico
	def ==(ob)
		if @num == ob.num and @den ==  ob.denom and ob.instance_of? Racional
			true
		else
		false
		end
	end
	
	#sobrecarga del operador - para calcular la inversa
	def -@
		Racional.new(@num*-1, @den)
	end

	def +(other)
	  if other.class == Racional then
          	num = (@num * other.denom) + (other.num * @den)
          	den = (@den * other.denom)          	
	  else
		num = @num+ (other * @den)
		den = @den
    	  end
	return Racional.new(num, den)
	end

	def -(other)
	  if other.class == Racional then
         	 num = (@num * other.denom) - (other.num * @den)
          	den = (@den * other.denom)
	  else
		num = @num - (other * @den)
		den = @den
	  end
          Racional.new(num, den)
        end

	def *(other)
          num = (@num * other.num)
          den = (@den * other.denom)
          Racional.new(num, den)
        end

	def /(other)
          num = (@num * other.denom)
          den = (@den * other.num)
          Racional.new(num, den)
        end

	def %(other)
	  num = (@num % @den)
	  den = (other.num % other.denom)
	  Racional.new(num, den)
	end
	
	def eql?(o)
          return @num.eql?(o.num) && @den.eql?(o.denom) if o.instance_of? Racional
          false
        end
	
	#Operador guerra de las galaxia que permite comparar Racionales
	def <=>(o)
          return nil unless o.instance_of? Racional
          @den*@den+@num*@num <=> o.denom*o.denom+o.num*o.num
        end
end

