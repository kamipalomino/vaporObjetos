<<<<<<< refs/remotes/origin/master
=======
/** First Wollok example */
class Juegos {
	//const property juego
	var property nivelDificultad 
	var property sangrePorHora
	var property horasJugadas 
	var property gemas 
	var property experiencia 
	var property precioJuego 
	
	method precio()=precioJuego
	method precio(valor){ 
		precioJuego = valor
		return precioJuego
	}
	method nivelDificultad()=nivelDificultad
	method otorgarGemas(unaG){
		 gemas.sum{ => unaG + gemas}
		 return gemas
	}
	method otorgarGemas()=gemas	
	method sangrePorHora() {
		return sangrePorHora*horasJugadas
	}
}
/* Avance: los logros de avance otorgan tantas gemas como tiempo que se jugó al juego en esta oportunidad * dificultad (que es un valor numérico) que tenía el juego al momento de entregar ese logro.
Secreto Desbloqueado: cada uno de los logros de secreto desbloqueado otorga una cantidad diferente de gemas.
Experiencia Alcanzada: otorgan tantas gemas como la décima parte de la experiencia gamer que se haya alcanzado al momento de recibir el logro, sumado a la dificultad del juego en ese instante.
Para cada logro, debemos conocer qué juego lo otorgó. Y una vez obtenido el logro, no se puede modificar ninguna de sus características 
* (por ejemplo, un logro de avance siempre tendrá la dificultad del juego en aquél momento).
Para cada juego, se conoce su nivel de dificultad, y una cantidad de sangre que aparece por hora jugada.

Parte 1
 */
object avance inherits Logros{
	override method otorgarGemas(horaJugada){
	 gemas = gemas +  horaJugada * nivelDificultad
	 return gemas	 
	}
}
object secretoDesbloqueado inherits Logros{
	
	var property logros = []
	override method otorgarGemas(){
		gemas = gemas + logros.sum{unLogro => unLogro.gemas()}	
		return gemas
	}
} 
object experienciaAlcanzada inherits Logros{
	
	override method otorgarGemas(){
		gemas= gemas + experiencia/10 + nivelDificultad
		return gemas
	}
}
class Logros inherits Juegos{
	var property juegos= #{}
	method agregarJuego(unJuego) = juegos.add(unJuego)
}
>>>>>>> Create juegos.wlk

