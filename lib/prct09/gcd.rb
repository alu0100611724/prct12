# = gcd.rb
#
# Autor:: Ivan Cabaleiro Escuderos.
# Autor:: Maurizio A. Rendon Mattogno.
# Web:: https://github.com/alu0100611724/prct11.git
#
#
# == Funcion gcd(u, v)
#
# Descripcion: Esta funcion calcula el maximo comun divisor
def gcd(u, v)
  u, v = u.abs, v.abs
  if (u==0 or v==0) #Con esta modificación podemos usar esta función tb para reducir
	return 1
  else
     while v > 0
        u, v = v, u % v
     end
    return u
  end
end
