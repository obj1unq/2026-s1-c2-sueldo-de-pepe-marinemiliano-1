// bono por resultados por porcentaje
import categorias.*
import pepe.*


object bonoPorcentaje {
	method monto(empleado) 
	{ 
		
		return empleado.sueldoNeto() * 10 / 100 		
	}
}


// bono por resultados de monto fijo
object bonoMontoFijo {
	
	method monto(empleado) {
	  
		return  800 
	}
}


/*
 * Bono nulo: sirve para resultados y para presentismo, cuando el importe es 0 
 * (o "nada")
 */

object bonoNulo {

	method monto(empleado) { return 0 } 
}


/*
// agregar bonos por presentismo  
object bonoPresentismoNormal {
	// agregar el método que se necesita
}
// agregar bonos ajuste y demagogico
 */



// agregar bonos por presentismo  
object bonoPresentismoNormal {
	
	method monto(empleado) 
	{ 
		return  if (empleado.cantidadDeFaltas() == 0 ) {
		  
		   	2000
		}
		else
		if (empleado.cantidadDeFaltas() == 1) {
		  
		   	1000
		}
		else
		{
			 0
		}
		 		
	}
	// agregar el método que se necesita
}
// agregar bonos ajuste y demagogico
 
object bonoPresentismoAjuste {
	
	method monto(empleado) 
	{ 
		return if (empleado.cantidadDeFaltas() == 0 ) {
	
		  	 100
		}
		else
		{
		  
			 0
		} 		
	}
}

//Demagógico: $500 pesos si el neto es menor a 18000, $300 en caso contrario. 
//Para este bono no importa cuántas veces faltó el emplado.

object  bonoPresentismoDemagogico {
  
	method monto(empleado) 
	{ 
		return  if (empleado.sueldoNeto() < 18000 ) {
		  
		  	 500
		}
		else
		{
		  
		 	 300
		} 		
	}
}


