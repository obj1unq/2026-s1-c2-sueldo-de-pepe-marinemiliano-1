import bonos.*
import pepe.*

// agregar cadete

//depende del estado de ejecucion dinamico
//estatico esta antes de la implementacion 

object gerente {
	method neto() { return 15000 } 
}

object cadete {
	
	method neto() { return 20000 } 
}

/*
Agregar las siguientes categorías

vendedor:
su neto es de 16000 pesos. Si hay muchas ventas, hay un aumento de 25% (multiplicar por 1.25), 
o sea pasa a 20000.
El objeto que representa a esta categoría tiene que entender los mensajes 
activarAumentoPorMuchasVentas() y desactivarAumentoPorMuchasVentas().

medio tiempo: en realidad, es un modificador sobre otra categoría, que se asigna 
enviando el mensaje medioTiempo.categoriaBase(categoria). 
Indica que la persona trabaja medio tiempo, por lo tanto su neto es la mitad 
(dividir por dos) de lo que indica la categoría base.
P.ej. si definimos medioTiempo.categoriaBase(gerente), 
entonces el neto de medioTiempo es 7500 (la mitad de 15000).
*/

object vendedor {
  
    var muchasVentas = true

	method hayMuchasVentas() {
	  
	  return muchasVentas
	}
	
	method neto() { 
		
		return if (self.hayMuchasVentas() ) {
		  
		    16000 * 1.25 
		}
		else
		{

		    16000 
		}

	}

	//setter orden, modifica el estado de las variables
	method activarAumentoPorMuchasVentas(){
		
		muchasVentas = true
	} 
		
	method desactivarAumentoPorMuchasVentas() {
	  
	   muchasVentas = false
	}

}


/*
medio tiempo: en realidad, es un modificador sobre otra categoría, 
que se asigna enviando el mensaje medioTiempo.categoriaBase(categoria).
 Indica que la persona trabaja medio tiempo, por lo tanto su neto es la
  mitad (dividir por dos) de lo que indica la categoría base.
P.ej. si definimos medioTiempo.categoriaBase(gerente), entonces el neto 
de medioTiempo es 7500 (la mitad de 15000).
*/
object medioTiempo {

	var categoria = null

	method neto() {return categoria.neto() / 2}
  
	method categoriaBase(_nuevaCategoria) {
	
		categoria = _nuevaCategoria
	}
}
