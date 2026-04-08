import categorias.*
import bonos.*

object pepe {

	var categoria = gerente
	var bonoPresentismo = bonoNulo
	var bonoResultado = bonoNulo
	var cantidadDeFaltas = 0


		method sueldo() {

			return self.sueldoNeto() + self.valorPorPresentismo() 
		/* notar que todos los bonos entienden el mensaje monto(empleado)
		 * en este caso ¿quién es el empleado?
		 */ 
	}


	method valorPorPresentismo() {
	  
	  return bonoPresentismo.monto(self) + bonoResultado.monto(self)
	}

	method bonoResultado() {return bonoResultado}

	method bonoPresentismo() {return bonoPresentismo}


	//llamo al atributo que es un objeto de por si
	method sueldoNeto() { return categoria.neto()}

	//method sueldoNeto() { return self.categoria().neto()}

	method categoria() {return categoria}
	
	method cantidadDeFaltas() { return cantidadDeFaltas }
	
	// faltan los métodos para poder cambiar la categoria, el bono por presentismo,
	// el bono por resultados y la cantidad de faltas de Pepe. 
	//setter
	method setCantidadFaltas(_faltas) {
	  
	  cantidadDeFaltas = _faltas
	}
	

	// faltan los métodos para poder cambiar la categoria, el bono por presentismo,
	method setCategoria(_nuevaCat) {
	  
	  categoria = _nuevaCat
	}
	

	method setBonoPresentismo(_bonoPresentismo) {
	  
	  bonoPresentismo = _bonoPresentismo
	}
	

	method setBonoResultado(_bonoResultado) {
	  
	  bonoResultado = _bonoResultado
	}
	
}

/*
Definir a Sofía, otra persona de la que hay que calcular el sueldo. 
Sofía solamente tiene bono por resultados, o sea que su sueldo se calcula 
como neto + bono x resultados.

A su vez, su neto es un 30% superior a lo que indica su categoría. 
P.ej. si Sofía es cadete, su neto es 26000. Recordar que para aumentar un número un 30%, 
se lo multiplica por 1.3.

Atención: si Pepe, o cualquier otra persona que se agregue, es cadete, su neto es 20000. 
El incremento del 30% se aplica solamente a Sofía.
*/

object sofia {
  
	var categoria = gerente
	var bonoPresentismo = bonoNulo
	var bonoResultado = bonoNulo
	var cantidadDeFaltas = 0

	method sueldoNeto(){ return categoria.neto() }

  	method sueldo() {
		
		return (self.sueldoNeto() * 1.3) + bonoResultado.monto(self)
		
		/* notar que todos los bonos entienden el mensaje monto(empleado)
		 * en este caso ¿quién es el empleado?
		 */ 
	}

	//setter
	method setCantidadFaltas(_faltas) {cantidadDeFaltas = _faltas}

	//getter
	method cantidadDeFaltas(){ return  cantidadDeFaltas }



	// faltan los métodos para poder cambiar la categoria, el bono por presentismo,
	method setCategoria(nuevaCat){categoria = nuevaCat}
	
	method cambiarBonoPresentismo(nuevoBonoPresentismo) {bonoPresentismo = nuevoBonoPresentismo}
	
	method cambiarBonoResultado(nuevoBonoResultado) {bonoResultado = nuevoBonoResultado}


}


/*
Agregar dos personas más, según lo que se detalla a continuación.

Roque, que en lugar de asignársele una categoría, se establece un neto de 28000 pesos.
El sueldo se calcula como neto + bono por resultados + 9000 pesos.
Para el bono por resultados, se usan las mismas opciones que para Pepe.

*/

object roque {
	

	var bonoResultado = bonoNulo
	
	//var cantidadDeFaltas = 0
	//var categoria = gerente
	//var bonoPresentismo = bonoNulo
	

	method sueldoNeto(){ return 28000 }

  	method sueldo() {

		return self.sueldoNeto() + bonoResultado.monto() + 9000
		
		/* notar que todos los bonos entienden el mensaje monto(empleado)
		 * en este caso ¿quién es el empleado?
		 */ 
	}

	method bonoResultado() {return bonoResultado}

	method setBonoResultado(_bonoResultado) {
	  
	  bonoResultado = _bonoResultado
	}
}

/*
Ernesto, que trabaja junto con un compañero, que puede cambiar. 
El neto de Ernesto es igual al de su compañero.
Su sueldo se calcula como neto + bono por presentismo.
Para el bono por presentismo, usar las mismas opciones que para Pepe. 
Se sabe que Ernesto no falta nunca.
*/
object ernesto {
	
	var compañero = null

	var bonoPresentismo = bonoNulo

	const refParaBonoPresentismo = pepe


	method sueldoNeto(){return compañero.sueldoNeto()}

	method sueldo() {			   //valor por presentismo agregarlo luego
		return self.sueldoNeto() + refParaBonoPresentismo.bonoPresentismo().monto(refParaBonoPresentismo) 
			
		/* notar que todos los bonos entienden el mensaje monto(empleado)
		 * en este caso ¿quién es el empleado?
		 */ 
	}


	method cantidadDeFaltas() { return  0}

	method nuevoCompañero(nuevoCompañero) {compañero = nuevoCompañero}
	
	method cambiarBonoPresentismo(nuevoBonoPresentismo) {bonoPresentismo = nuevoBonoPresentismo}

	
	
}
