import juegos.*
class Jugador {
	var property billeteraVirtual 
	var property  gemas = 0
	var property juegos = #{}
	var property experiencia = 0
	var property logros = #{}
	
	method agregateUnJuego(unJuego){juegos.add(unJuego)}
	mrthod logros()=logros
	method juegos() = juegos
	method agregateUnLogro(unLogro){self.logros().add(unLogro)}
	method experiencia()= experiencia
	method experienciaGamer(unasHoras)= {experiencia = unasHoras*25}
	method gemas()= self.logros().sum{logro => logro.otorgaGemas()}
	

	
	method transformarLogrosEnDinero(){
		billeteraVirtual += gemas
		gemas =0
		return billeteraVirtual
	}
	 
	method compraJuego(unJuego){
		if((billeteraVirtual + gemas) < unJuego.precio()){
			throw new ExcepcionPorFaltaDeDinero ("No tenés dinero genio")
		}
		self.transformarLogrosEnDinero()- unJuego.precio()
		self.agregateUnJuego(unJuego)
		return juegos
		}
	
}
class ExcepcionPorFaltaDeDinero inherits Exception {}
/*Saber cuántas gemas tiene un jugador. Esto es la suma de las gemas que le otorga cada logro obtenido.
Hacer que un jugador compre un juego. Cada juego tiene cierto valor.
Si no puede comprarlo, se debe lanzar una excepción. Puede comprarlo únicamente si lo que tiene en su billetera virtual + sus gemas (1 gema = $1) es suficiente para lo que cuesta el juego. Tampoco puede comprar un juego si es que ya lo había comprado.
Si puede comprarlo pero no le alcanza el dinero de la billetera, primero debe transformar todos sus logros en dinero (sí,  todos) y luego gastar en el juego.
Sabiendo que un logro es importante cuando otorga más de 500 gemas (salvo los logros de avance, que nunca son importantes), conocer en qué juegos se obtuvieron logros importantes.

Si el juego es rosita no nos interesa, ya que no podemos alardear con algo así.
Es rosita si tiene menos de 1 litro de sangre por hora o la dificultad es 2 o menos.
 
  const peroperty logros = #{}
  >> gemas() = self.logros().sum({logro => logro.gemas()})
  >> agregáLogro(unLogro){ // De ahora en más, asumimos que para cada colección hay un "agregá..."
    self.logros().add(unLogro)
  }

 
 
 
 */
