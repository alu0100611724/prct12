$:.unshift File.dirname(__FILE__) + '/../lib'
require 'prct09/matriz_dispersa.rb'
require 'prct09/matriz_densa.rb'

class Operaciones

        Densa = "Densa"
          Dispersa = "Dispersa"
          attr_accessor :cont

        def initialize(name = "", &block)
                @cont = 0
                @valor = ""
                instance_eval &block
                
        end
        def operacion(tipo,lista)
                vector = Array.new
                matrices = lista.each {|key, value| vector << matriz(key,value)}
                acumulado = vector.pop()
                case tipo
                when "suma"
                        valor = vector.each{|a| acumulado = a + acumulado}
                when "resta"
                        valor = vector.each{|a| acumulado = a - acumulado}
                when "multiplicacion"
                        valor = vector.each{|a| acumulado = a * acumulado}
                end
                @valor  << tipo  << "\n" << acumulado.to_s.to_s << "\n"
        end
        def densa(f,c)
                @cont = @cont + 1;
                [@cont,"Densa",f,c]
        end
        def dispersa(f,c)
                @cont = @cont + 1;
                [@cont,"Dispersa",f,c]
        end
        def matriz(tipo,valor)
                if tipo[1] == "Densa"
                        return Matriz_densa.new(valor)
                end
                if tipo[1] == "Dispersa"
                        return Matriz_dispersa.new(valor)
                end
        end
        def to_s
                @valor
        end
end

