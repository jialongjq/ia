;========================================================================
;=                          CLASES ABSTRACTAS                           =
;========================================================================

(defclass ViviendaAbstracta (is-a USER) (role concrete)
	(slot vivienda (type INSTANCE) (allowed-classes Vivienda) (create-accessor read-write))
    ;(multislot serviciosLejanos (type INSTANCE) (allowed-classes Servicio) (create-accessor read-write))
    (multislot serviciosCercanos (type INSTANCE) (allowed-classes Servicio) (create-accessor read-write))
    (slot grado (type SYMBOL) (allowed-values PARCIALMENTE-ADECUADO ADECUADO MUY-RECOMENDABLE) (create-accessor read-write))
    (multislot detallesGrado (type STRING) (create-accessor read-write))
    (slot puntuacion (type INTEGER) (default 0))
    (multislot detallesPuntuacion (type STRING) (create-accessor read-write))
)

;========================================================================
;=                              HANDLERS                                =
;========================================================================

(defmessage-handler MAIN::Vivienda calcular-num-dorm-simples ()
    (bind $?dormitorios ?self:tiene_dormitorio)
    (bind ?cont 0)
    (progn$ (?dormitorio $?dormitorios)
        (if (eq (class ?dormitorio) Simple) then (bind ?cont (+ 1 ?cont)))
    )
    ?cont
)

(defmessage-handler MAIN::Vivienda calcular-num-empotrados-simples ()
    (bind $?dormitorios ?self:tiene_dormitorio)
    (bind ?cont 0)
    (progn$ (?dormitorio $?dormitorios)
        (if (and (eq (class ?dormitorio) Simple) (eq (send ?dormitorio get-armario_empotrado) TRUE)) then
            (bind ?cont (+ 1 ?cont))
        )
    )
    ?cont
)

(defmessage-handler MAIN::Vivienda calcular-num-dorm-dobles ()
    (bind $?dormitorios ?self:tiene_dormitorio)
    (bind ?cont 0)
    (progn$ (?dormitorio $?dormitorios)
        (if (eq (class ?dormitorio) Doble) then (bind ?cont (+ 1 ?cont)))
    )
    ?cont
)

(defmessage-handler MAIN::Vivienda calcular-num-empotrados-dobles ()
    (bind $?dormitorios ?self:tiene_dormitorio)
    (bind ?cont 0)
    (progn$ (?dormitorio $?dormitorios)
        (if (and (eq (class ?dormitorio) Doble) (eq (send ?dormitorio get-armario_empotrado) TRUE)) then
            (bind ?cont (+ 1 ?cont))
        )
    )
    ?cont
)

(defmessage-handler MAIN::Vivienda calcular-num-banyos ()
    (bind $?banyos ?self:tiene_banyos)
    (length$ $?banyos)
)

(defmessage-handler MAIN::Vivienda calcular-num-banyeras ()
    (bind $?banyos ?self:tiene_banyos)
    (bind ?cont 0)
    (progn$ (?banyo $?banyos)
        (if (eq (send ?banyo get-has_banyera) TRUE) then (bind ?cont (+ ?cont 1)))
    )
    ?cont
)

(defmessage-handler MAIN::Vivienda calcular-num-duchas ()
    (bind $?banyos ?self:tiene_banyos)
    (bind ?cont 0)
    (progn$ (?banyo $?banyos)
        (if (eq (send ?banyo get-has_ducha) TRUE) then (bind ?cont (+ ?cont 1)))
    )
    ?cont
)

(deffunction MAIN::distancia-euclidiana (?x1 ?y1 ?x2 ?y2)
    (sqrt(+ (*(- ?x2 ?x1) (- ?x2 ?x1)) (*(- ?y2 ?y1) (- ?y2 ?y1))))
)

(defmessage-handler MAIN::Vivienda buscar-servicios-cercanos ()
    (find-all-instances ((?servicio Servicio)) (<= (distancia-euclidiana (send ?self get-longitud_x) (send ?self get-latitud_y) (send ?servicio get-longitud_x) (send ?servicio get-latitud_y)) 1000))
)

(defmessage-handler MAIN::Vivienda buscar-servicios-lejanos ()
    (find-all-instances ((?servicio Servicio)) (> (distancia-euclidiana (send ?self get-longitud_x) (send ?self get-latitud_y) (send ?servicio get-longitud_x) (send ?servicio get-latitud_y)) 1000))
)

(defmessage-handler MAIN::ViviendaAbstracta print()
    (printout t (instance-name ?self:vivienda) crlf)
    
    (if (> (length$ ?self:serviciosCercanos) 0) then
        (printout t "Lista de servicios cercanos: " crlf)
        (progn$ (?var ?self:serviciosCercanos)
            (printout t "- " ?var " (" (class ?var) ")" crlf)
        )
    )
    
    (if (neq ?self:grado ADECUADO) then
        (printout t "Detalles de la recomendacion:" crlf)
        (progn$ (?var ?self:detallesGrado)
        (printout t ?var crlf)
        )
    )

    (printout t "Puntuacion: " ?self:puntuacion crlf)
    (progn$ (?var ?self:detallesPuntuacion)
        (printout t ?var crlf)
    )
)

;========================================================================
;=                              DefTemplates                            =
;========================================================================

(deftemplate MAIN::Perfil
    (slot edad (type INTEGER)(default -1))
    (multislot estadoCivil (type SYMBOL)(allowed-values PAREJA SOLTERO HIJOS DIVORCIADO UNDEF)(default UNDEF))
    (slot mayores (type SYMBOL) (allowed-values TRUE FALSE UNDEF)(default UNDEF))
    (slot trabajaCiudad (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot distritoTrabajo (type SYMBOL) (allowed-values CIUTAT-VELLA EIXAMPLE GRACIA HORTA-GUINARDO LES-CORTS NOU-BARRIS SANT-ANDREU SANT-MARTI SANTS-MONTJUIC SARRIA-SANT-GERVASI UNDEF) (default UNDEF))
    (slot coche (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
)

(deftemplate MAIN::Caracteristicas
    (slot tipoVivienda (type SYMBOL) (allowed-values UNIFAMILIAR DUPLEX PISO UNDEF) (default UNDEF))
    (slot sotano (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot precioMin (type INTEGER) (default -1))
    (slot precioMax (type INTEGER) (default -1))
    (slot metros2 (type INTEGER) (default -1))
    (slot numDormSimple (type INTEGER) (default -1))
    (slot numEmpotradosSimple (type INTEGER) (default -1))
    (slot numDormDoble (type INTEGER) (default -1))
    (slot numEmpotradosDoble (type INTEGER) (default -1))
    (slot numBanyos (type INTEGER) (default -1))
    (slot numBanyeras (type INTEGER) (default -1))
    (slot numDuchas (type INTEGER) (default -1))
    (slot balcon (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot terraza (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot ascensor (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot parking (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot garaje (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot mascotas (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (multislot serviciosLejanos (type SYMBOL) (allowed-values INDUSTRIAL OCIO OFICINA COMERCIAL EDUCACION ZONAVERDE SANIDAD TRANSPORTE UNDEF) (default UNDEF))
    (multislot serviciosCercanos (type SYMBOL) (allowed-values INDUSTRIAL OCIO OFICINA COMERCIAL EDUCACION ZONAVERDE SANIDAD TRANSPORTE UNDEF) (default UNDEF))
    (slot aireAcondicionado (type SYMBOL)(allowed-values TRUE FALSE UNDEF)(default UNDEF))
    (slot calefaccion (type SYMBOL)(allowed-values TRUE FALSE UNDEF)(default UNDEF))
    (slot gas (type SYMBOL) (allowed-values NATURAL BUTANO UNDEF) (default UNDEF))
    (slot muebles (type SYMBOL)(allowed-values TRUE FALSE UNDEF)(default UNDEF))
    (slot electrodomesticos (type SYMBOL)(allowed-values TRUE FALSE UNDEF)(default UNDEF))
    (slot sol (type SYMBOL) (allowed-values DIA MANYANA TARDE UNDEF)(default UNDEF))
    (slot vistas (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
    (slot piscina (type SYMBOL) (allowed-values TRUE FALSE UNDEF) (default UNDEF))
)

(deftemplate MAIN::Obligatoriedad
    ; OP = Obligatorio, P = Preferible, I = Indiferente
    (slot tipoVivienda (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot sotano (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot precioMin (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot precioMax (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot metros2 (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numDormSimple (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numEmpotradosSimple (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numDormDoble (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numEmpotradosDoble (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numBanyos (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numBanyeras (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot numDuchas (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot balcon (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot terraza (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot ascensor (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot parking (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot garaje (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot mascotas (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot serviciosLejanos (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot serviciosCercanos (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot aireAcondicionado (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot calefaccion (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot gas (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot muebles (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot electrodomesticos (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot sol (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot vistas (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
    (slot piscina (type SYMBOL) (allowed-values O P I UNDEF) (default UNDEF))
)

;========================================================================
;=                               Modulos                                =
;========================================================================

(defmodule MAIN (export ?ALL))
(defmodule PREGUNTAS (import MAIN ?ALL) (export ?ALL))
(defmodule ABSTRACCION (import MAIN ?ALL) (export ?ALL))
(defmodule SOLUCION (import MAIN ?ALL) (export ?ALL))

;========================================================================
;=                              Funciones                               =
;========================================================================

(deffunction MAIN::pregunta-opciones "Funcion para formular preguntas con opciones" (?pregunta $?respuestas-validas)
    (format t "%s" ?pregunta)
    (bind ?respuesta (read))
    (while (or (not (lexemep ?respuesta)) (not (member$ (lowcase ?respuesta) $?respuestas-validas))) do
        (format t "%s" ?pregunta)
        (bind ?respuesta (read)))
    (lowcase ?respuesta)
)

(deffunction MAIN::pregunta-opciones-num "Funcion para formular preguntas con opciones numericas" (?pregunta $?respuestas-validas)
    (format t "%s" ?pregunta)
    (bind ?respuesta (read))
    (while (or (not (integerp ?respuesta)) (not (member$ ?respuesta $?respuestas-validas))) do
        (format t "%s" ?pregunta)
        (bind ?respuesta (read)))
    ?respuesta
)

(deffunction MAIN::pregunta-numerica-minimo "Funcion para formular preguntas numericas dado un valor minimo" (?pregunta ?minimo)
    (format t "%s" ?pregunta)
    (bind ?respuesta (read))
    (while(or(not (integerp ?respuesta))(< ?respuesta ?minimo)) do
      (format t "%s" ?pregunta)
      (bind ?respuesta (read))
  )
  ?respuesta
)

(deffunction MAIN::pregunta-numerica-rango "Funcion para formular preguntas numericas dado un rango" (?pregunta ?minimo ?maximo)
    (format t "%s" ?pregunta)
    (bind ?respuesta (read))
    (while(or(not (integerp ?respuesta))(or(> ?respuesta ?maximo)(< ?respuesta ?minimo))) do
      (format t "%s" ?pregunta)
      (bind ?respuesta (read))
    )
  ?respuesta
)

(deffunction MAIN::pregunta-binaria "Preguntas con respuesta binaria [s/n]" (?pregunta)
    (bind ?respuesta (pregunta-opciones ?pregunta s n))
    (if (eq ?respuesta s)
       then TRUE
       else FALSE)
)

(deffunction MAIN::pregunta-multirespuesta "Preguntas con multiples respuestas" (?pregunta $?respuestas-validas)
    (bind ?valid FALSE)
    (while (not ?valid) do
        (format t "%s" ?pregunta)
        (bind ?found FALSE)
        (bind ?respuesta (lowcase (readline)))
        (bind $?lista (explode$ ?respuesta))
        (progn$ (?elemento $?lista)
            (if (not (member$ ?elemento $?respuestas-validas)) then (bind ?found TRUE))
        )
        (if (not ?found) then (bind ?valid true))
    )
    $?lista
)

(deffunction MAIN::comprobar-restricciones (?vivienda ?caracteristicas ?obligatoriedad)
    (bind ?incumplidas 0)
    (bind ?obligatoriedadTipoVivienda (fact-slot-value ?obligatoriedad tipoVivienda))
    (if (eq ?obligatoriedadTipoVivienda O) then 
        (bind ?tipoVivienda (fact-slot-value ?caracteristicas tipoVivienda))
        (if (neq ?tipoVivienda (upcase (class ?vivienda))) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadPrecioMin (fact-slot-value ?obligatoriedad precioMin))
    (if (eq ?obligatoriedadPrecioMin O) then 
        (bind ?precioMin (fact-slot-value ?caracteristicas precioMin))
        (if (> ?precioMin (send ?vivienda get-precio_mensual)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadPrecioMax (fact-slot-value ?obligatoriedad precioMax))
    (if (eq ?obligatoriedadPrecioMax O) then 
        (bind ?precioMax (fact-slot-value ?caracteristicas precioMax))
        (if (< ?precioMax (send ?vivienda get-precio_mensual)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadMetros2 (fact-slot-value ?obligatoriedad metros2))
    (if (eq ?obligatoriedadMetros2 O) then 
        (bind ?metros2 (fact-slot-value ?caracteristicas metros2))
        (if (> ?metros2 (send ?vivienda get-m2_habitable)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadNumDormSimple (fact-slot-value ?obligatoriedad numDormSimple))
    (if (eq ?obligatoriedadNumDormSimple O) then 
        (bind ?numDormSimple (fact-slot-value ?caracteristicas numDormSimple))
        (if (> ?numDormSimple (send ?vivienda calcular-num-dorm-simples)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadNumEmpotradosSimple (fact-slot-value ?obligatoriedad numEmpotradosSimple))
    (if (eq ?obligatoriedadNumEmpotradosSimple O) then 
        (bind ?numEmpotradosSimple (fact-slot-value ?caracteristicas numEmpotradosSimple))
        (if (> ?numEmpotradosSimple (send ?vivienda calcular-num-empotrados-simples)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )

    )
    (bind ?obligatoriedadNumDormDoble (fact-slot-value ?obligatoriedad numDormDoble))
    (if (eq ?obligatoriedadNumDormDoble O) then 
        (bind ?numDormDoble (fact-slot-value ?caracteristicas numDormDoble))
        (if (> ?numDormDoble (send ?vivienda calcular-num-dorm-dobles)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadNumEmpotradosDoble (fact-slot-value ?obligatoriedad numEmpotradosDoble))
    (if (eq ?obligatoriedadNumEmpotradosDoble O) then 
        (bind ?numEmpotradosDoble (fact-slot-value ?caracteristicas numEmpotradosDoble))
        (if (> ?numEmpotradosDoble (send ?vivienda calcular-num-empotrados-dobles)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadNumBanyos (fact-slot-value ?obligatoriedad numBanyos))
    (if (eq ?obligatoriedadNumBanyos O) then
        (bind ?numBanyos (fact-slot-value ?caracteristicas numBanyos))
        (if (> ?numBanyos (send ?vivienda calcular-num-banyos)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadNumBanyeras (fact-slot-value ?obligatoriedad numBanyeras))
    (if (eq ?obligatoriedadNumBanyeras O) then
        (bind ?numBanyeras (fact-slot-value ?caracteristicas numBanyeras))
        (if (> ?numBanyeras (send ?vivienda calcular-num-banyeras)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadNumDuchas (fact-slot-value ?obligatoriedad numDuchas))
    (if (eq ?obligatoriedadNumDuchas O) then
        (bind ?numDuchas (fact-slot-value ?caracteristicas numDuchas))
        (if (> ?numDuchas (send ?vivienda calcular-num-duchas)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadBalcon (fact-slot-value ?obligatoriedad balcon))
    (if (eq ?obligatoriedadBalcon O) then
        (bind ?balcon (fact-slot-value ?caracteristicas balcon))
        (if (neq ?balcon (send ?vivienda get-has_balcon)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadTerraza (fact-slot-value ?obligatoriedad terraza))
    (if (eq ?obligatoriedadTerraza O) then
        (bind ?terraza (fact-slot-value ?caracteristicas terraza))
        (if (neq ?terraza (send ?vivienda get-has_terraza)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadAscensor (fact-slot-value ?obligatoriedad ascensor))
    (if (eq ?obligatoriedadAscensor O) then
        (bind ?ascensor (fact-slot-value ?caracteristicas ascensor))
        (if (neq ?ascensor (send ?vivienda get-has_ascensor)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadParking (fact-slot-value ?obligatoriedad parking))
    (if (eq ?obligatoriedadParking O) then
        (bind ?parking (fact-slot-value ?caracteristicas parking))
        (if (or (eq (class ?vivienda) Unifamiliar) (neq ?parking (send ?vivienda get-has_parking))) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadGaraje (fact-slot-value ?obligatoriedad garaje))
    (if (eq ?obligatoriedadGaraje O) then
        (bind ?garaje (fact-slot-value ?caracteristicas garaje))
        (if (or (not (eq (class ?vivienda) Unifamiliar)) (neq ?garaje (send ?vivienda get-has_garaje))) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadMascotas (fact-slot-value ?obligatoriedad mascotas))
    (if (eq ?obligatoriedadMascotas O) then
        (bind ?mascotas (fact-slot-value ?caracteristicas mascotas))
        (if (neq ?mascotas (send ?vivienda get-mascotas)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadAire (fact-slot-value ?obligatoriedad aireAcondicionado))
    (if (eq ?obligatoriedadAire O) then
        (bind ?aire (fact-slot-value ?caracteristicas aireAcondicionado))
        (if (neq ?aire (send ?vivienda get-has_aire)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadCalefaccion (fact-slot-value ?obligatoriedad calefaccion))
    (if (eq ?obligatoriedadCalefaccion O) then
        (bind ?calefaccion (fact-slot-value ?caracteristicas calefaccion))
        (if (neq ?calefaccion (send ?vivienda get-has_calefaccion)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadGas (fact-slot-value ?obligatoriedad gas))
    (if (eq ?obligatoriedadGas O) then
        (bind ?gas (fact-slot-value ?caracteristicas gas))
        (if (neq ?gas (send ?vivienda get-gas)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadMuebles (fact-slot-value ?obligatoriedad muebles))
    (if (eq ?obligatoriedadMuebles O) then
        (bind ?muebles (fact-slot-value ?caracteristicas muebles))
        (if (neq ?muebles (send ?vivienda get-muebles)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadElectrodomesticos (fact-slot-value ?obligatoriedad electrodomesticos))
    (if (eq ?obligatoriedadElectrodomesticos O) then
        (bind ?electrodomesticos (fact-slot-value ?caracteristicas electrodomesticos))
        (if (neq ?electrodomesticos (send ?vivienda get-electrodomesticos)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadSol (fact-slot-value ?obligatoriedad sol))
    (if (eq ?obligatoriedadSol O) then
        (bind ?sol (fact-slot-value ?caracteristicas sol))
        (if (neq ?sol (send ?vivienda get-soleado)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadVistas (fact-slot-value ?obligatoriedad vistas))
    (if (eq ?obligatoriedadVistas O) then
        (bind ?vistas (fact-slot-value ?caracteristicas vistas))
        (if (neq ?vistas (send ?vivienda get-has_vistas)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadPiscina (fact-slot-value ?obligatoriedad piscina))
    (if (eq ?obligatoriedadPiscina O) then
        (bind ?piscina (fact-slot-value ?caracteristicas piscina))
        (if (neq ?piscina (send ?vivienda get-has_piscina)) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    (bind ?obligatoriedadSotano (fact-slot-value ?obligatoriedad sotano))
    (if (eq ?obligatoriedadSotano O) then
        (bind ?sotano (fact-slot-value ?caracteristicas sotano))
        (if (or (not (eq (class ?vivienda) Unifamiliar)) (neq ?sotano (send ?vivienda get-has_sotano))) then
            (bind ?incumplidas (+ ?incumplidas 1))
        )
    )
    ; Si hay que comprobar restricciones sobre los servicios, entonces se ha de hacer un filtrado para comprobar que tipos de servicios hay cerca
    (bind ?obligatoriedadServiciosCercanos (fact-slot-value ?obligatoriedad serviciosCercanos))
    (bind ?obligatoriedadServiciosLejanos (fact-slot-value ?obligatoriedad serviciosLejanos))
    (if (or (eq ?obligatoriedadServiciosCercanos O) (eq ?obligatoriedadServiciosLejanos O)) then
        (bind $?serviciosCercanosVivienda (send ?vivienda buscar-servicios-cercanos))
        (bind $?filtradoServicios (create$))
        (progn$ (?servicio $?serviciosCercanosVivienda)
            (if (not (member$ (upcase (class ?servicio)) $?filtradoServicios)) then (bind $?filtradoServicios (insert$ $?filtradoServicios 1 (upcase (class ?servicio)))))
        )
    )
    ; Si el cliente quiere ciertos servicios cerca obligatoriamente entonces han de estar cerca de la vivienda recomendada
    (if (eq ?obligatoriedadServiciosCercanos O) then
        (bind $?serviciosCercanos (fact-slot-value ?caracteristicas serviciosCercanos))
        (progn$ (?servicioCercano $?serviciosCercanos)
            (if (not (member$ ?servicioCercano $?filtradoServicios)) then (bind ?incumplidas (+ ?incumplidas 1)) (break))
        )
    )
    ; Si el cliente quiere ciertos servicios lejos obligatoriamente entonces no pueden estar cerca de la vivienda recomendada
    (if (eq ?obligatoriedadServiciosLejanos O) then
        (bind $?serviciosLejanos (fact-slot-value ?caracteristicas serviciosLejanos))
        (progn$ (?servicioLejano $?serviciosLejanos)
            (if (member$ ?servicioLejano $?filtradoServicios) then (bind ?incumplidas (+ ?incumplidas 1)) (break))
        )
    )
    
    ?incumplidas
)

(deffunction MAIN::crear-vivienda-abstracta (?vivienda ?perfil ?caracteristicas ?obligatoriedad ?grado)
    (bind ?puntuacion 0)
    (bind $?detallesGrado (create$))
    (bind $?detallesPuntuacion (create$))


    (bind $?serviciosCercanosVivienda (send ?vivienda buscar-servicios-cercanos))
    (bind $?filtradoServicios (create$))
    (progn$ (?servicio $?serviciosCercanosVivienda)
        (if (not (member$ (upcase (class ?servicio)) $?filtradoServicios)) then (bind $?filtradoServicios (insert$ $?filtradoServicios 1 (upcase (class ?servicio)))))
    )
    (bind $?scercanos (fact-slot-value ?caracteristicas serviciosCercanos))
    (bind $?slejanos (fact-slot-value ?caracteristicas serviciosLejanos))
    ; ANALISIS DE LAS CARACTERISTICAS DEL PERFIL
    ;Segun si tiene coche
    (bind ?coche (fact-slot-value ?perfil coche))
    (if (eq ?coche TRUE) 
        then
        (if (eq (class ?vivienda) Unifamiliar) 
            then   
            (if (and (eq (fact-slot-value ?caracteristicas garaje) TRUE) (eq (send ?vivienda get-has_garaje) TRUE))
                then
                (bind ?var (fact-slot-value ?obligatoriedad garaje))
                (switch ?var
                    (case O 
                        then 
                        (bind ?puntuacion (+ 5 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] El cliente tiene coche y cumple la obligatoriedad de que tenga garaje"))
                    )
                    (case P 
                        then 
                        (bind ?puntuacion (+ 3 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] El cliente tiene coche y tener garaje es una preferencia"))
                    )
                    (case I 
                        then 
                        (bind ?puntuacion (+ 1 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] El cliente tiene coche y le es indiferente tener garaje"))
                    )
                )
            )
            ;Si la vivienda es duplex o piso
            else
            (if (and (eq (fact-slot-value ?caracteristicas parking) TRUE) (eq (send ?vivienda get-has_parking) TRUE))
                then
                (bind ?var (fact-slot-value ?obligatoriedad parking))
                (switch ?var
                    (case O 
                        then 
                        (bind ?puntuacion (+ 5 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] El cliente tiene coche y cumple la obligatoriedad de que tenga parking"))
                    )
                    (case P 
                        then 
                        (bind ?puntuacion (+ 3 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] El cliente tiene coche y tener parking es una preferencia"))
                    )
                    (case I 
                        then 
                        (bind ?puntuacion (+ 1 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] El cliente tiene coche y le es indiferente tener parking"))
                    )
                )
            )          
        )
        else
        (if (member$ TRANSPORTE $?filtradoServicios)
            then
            (if (member$ TRANSPORTE $?scercanos)
                then
                (bind ?var (fact-slot-value ?obligatoriedad serviciosCercanos))
                (switch ?var
                    (case O then 
                        (bind ?puntuacion (+ 5 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] No tiene coche y cumple la obligatoriedad de tener cerca a un servicio de transporte"))
                    )
                    (case P then 
                        (bind ?puntuacion (+ 3 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] No tiene coche y cumple la preferencia de tener cerca a un servicio de transporte"))
                    )
                    (case I then 
                        (bind ?puntuacion (+ 1 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] No tiene coche y le es indiferente tener cerca un servicio de transporte"))
                    )
                )
                else
                (if (not(member$ TRANSPORTE $?slejanos))
                    then
                    (bind ?puntuacion (+ 1 ?puntuacion))
                    (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] No tiene coche y la vivienda tiene servicios de transporte cerca"))
                )
            )
        )
    )
    ;Segun el sitio de trabajo
    (bind ?trabajabcn (fact-slot-value ?perfil trabajaCiudad))
    (if (eq ?trabajabcn TRUE)
        then
        (bind ?lugartrabajo (fact-slot-value ?perfil distritoTrabajo))
        (if (eq ?lugartrabajo (send ?vivienda get-distrito_ciudad))
            then
            (bind ?puntuacion (+ 5 ?puntuacion))
            (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] La vivienda esta en el mismo distrito donde trabaja"))
        )   
    )
    ;Segun si esta a cargo de senyores mayores
    (bind ?pmayores (fact-slot-value ?perfil mayores))
    (if (eq ?pmayores TRUE)
        then
        ;Miramos si la vivienda esta cerca de servicio sanitario
        (if (member$ SANIDAD $?filtradoServicios)
            then
            (if (member$ SANIDAD $?scercanos)
                then
                (bind ?var (fact-slot-value ?obligatoriedad serviciosCercanos))
                (switch ?var
                    (case O 
                        then 
                        (bind ?puntuacion (+ 5 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] Esta a cargo de mayores y cumple la obligatoriedad de tener cerca a un servicio de sanidad"))
                    )
                    (case P 
                        then 
                        (bind ?puntuacion (+ 3 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] Esta a cargo de mayores y cumple la preferencia de tener cerca a un servicio de sanidad"))
                    )
                    (case I 
                        then 
                        (bind ?puntuacion (+ 1 ?puntuacion))
                        (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Esta a cargo de mayores pero le es indiferente tener cerca un servicio de sanidad"))
                    )
                )
                else
                (if (not(member$ SANIDAD $?slejanos))
                    then
                    (bind ?puntuacion (+ 1 ?puntuacion))
                    (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Esta a cargo de mayores y la vivienda tiene servicios de sanidad cerca"))
                )
            )
        )
    )
    ;Segun el estado civil del cliente
    (bind $?ecivil (fact-slot-value ?perfil estadoCivil))
    (progn$ (?it $?ecivil)
        (switch ?it
            (case PAREJA 
                then
                (if (member$ COMERCIAL $?filtradoServicios)
                    then
                    (if (member$ COMERCIAL $?scercanos)
                        then
                        (bind ?var (fact-slot-value ?obligatoriedad serviciosCercanos))
                        (switch ?var
                            (case O 
                                then 
                                (bind ?puntuacion (+ 5 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] Tiene pareja y cumple la obligatoriedad de tener cerca un servicio comercial"))
                            )
                            (case P 
                                then 
                                (bind ?puntuacion (+ 3 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] Tiene pareja y cumple la preferencia de tener cerca un servicio comercial"))
                            )
                            (case I 
                                then 
                                (bind ?puntuacion (+ 1 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Tiene pareja y le es indiferente tener cercania un servicio comercial"))
                            )
                        )
                        else
                        (if (not(member$ COMERCIAL $?slejanos))
                            then
                            (bind ?puntuacion (+ 1 ?puntuacion))
                            (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Tiene pareja y la vivienda tiene servicios de COMERCIAL cerca"))
                        )
                    )
                )
            )
            (case HIJOS
                then
                (if (member$ EDUCACION $?filtradoServicios)
                    then
                    (if (member$ EDUCACION $?scercanos)
                        then
                        (bind ?var (fact-slot-value ?obligatoriedad serviciosCercanos))
                        (switch ?var
                            (case O 
                                then 
                                (bind ?puntuacion (+ 5 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] Tiene hijos y ademas cumple la obligatoriedad de tener cerca un servicio de educacion"))
                            )
                            (case P 
                                then 
                                (bind ?puntuacion (+ 3 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] Tiene hijos y cumple la preferencia de tener cerca un servicio de educacion"))
                            )
                            (case I 
                                then 
                                (bind ?puntuacion (+ 1 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Tiene hijos y le es indiferente tener cerca un servicio de educacion"))
                            )
                        )
                        else
                        (if (not(member$ EDUCACION $?slejanos))
                            then
                            (bind ?puntuacion (+ 1 ?puntuacion))
                            (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Tiene hijos y la vivienda tiene servicios de educacion cerca"))
                        )
                    )
                )
            )
            (case SOLTERO
                then
                (if (member$ OCIO $?filtradoServicios)
                    then
                    (if (member$ OCIO $?scercanos)
                        then
                        (bind ?var (fact-slot-value ?obligatoriedad serviciosCercanos))
                        (switch ?var
                            (case O 
                                then 
                                (bind ?puntuacion (+ 5 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+5 puntos] Es soltero y ademas cumple la obligatoriedad de tener cerca un servicio de ocio"))
                            )
                            (case P 
                                then 
                                (bind ?puntuacion (+ 3 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+3 puntos] Es soltero y cumple la preferencia de tener cerca un servicio de ocio"))
                            )
                            (case I 
                                then 
                                (bind ?puntuacion (+ 1 ?puntuacion))
                                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Es soltero y le es indiferente tener cerca un servicio de ocio"))
                            )
                        )
                        else
                        (if (not(member$ OCIO $?slejanos))
                            then
                            (bind ?puntuacion (+ 1 ?puntuacion))
                            (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+1 punto] Es soltero y la vivienda tiene servicios de ocio cerca"))
                        )
                    )
                )
            )
        )
    )

    ; COMPROBACION DE OBLIGATORIEDAD/PREFERENCIA

    ; Si la obligatoriedad es O: Si el grado es ADECUADO, se analiza a ver si puede haber alguna ventaja respecto a lo pedido. Si es PARCIALMENTE-ADECUADO, se especifica que es lo que no ha cumplido
    ; Si la obligatoriedad es P: Si las caracteristicas son las que se han pedido como preferente, entonces suma puntos en la puntuacion

    ; TIPO VIVIENDA
    (bind ?obligatoriedadTipoVivienda (fact-slot-value ?obligatoriedad tipoVivienda))
    (bind ?tipoVivienda (fact-slot-value ?caracteristicas tipoVivienda))
    (switch ?obligatoriedadTipoVivienda
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq ?tipoVivienda (upcase (class ?vivienda)))) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El tipo de vivienda no coincide con el solicitado"))
            )
        )
        (case P then
            (if (eq ?tipoVivienda (upcase (class ?vivienda))) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El tipo de vivienda coincide con el solicitado"))
            )
        )
    )

    ; PRECIO MIN
    (bind ?obligatoriedadPrecioMin (fact-slot-value ?obligatoriedad precioMin))
    (bind ?precioMin (fact-slot-value ?caracteristicas precioMin))
    (switch ?obligatoriedadPrecioMin
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (> ?precioMin (send ?vivienda get-precio_mensual))) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El precio mensual de la vivienda es inferior al precio minimo solicitado"))
            )
        )
        (case P then
            (if (<= ?precioMin (send ?vivienda get-precio_mensual)) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El precio mensual de la vivienda es igual o superior al precio minimo solicitado"))
            )
        )
    )
    
    ; PRECIO MAX
    (bind ?obligatoriedadPrecioMax (fact-slot-value ?obligatoriedad precioMax))
    (bind ?precioMax (fact-slot-value ?caracteristicas precioMax))
    (switch ?obligatoriedadPrecioMax
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< ?precioMax (send ?vivienda get-precio_mensual))) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El precio mensual de la vivienda es superior al precio maximo solicitado"))
                else (if (and (eq ?grado ADECUADO) (>= (* ?precioMax 0.75) (send ?vivienda get-precio_mensual))) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El precio mensual de la vivienda es al menos un 25% inferior al precio maximo solicitado"))
                )
            )
        )
        (case P then
            (if (>= ?precioMax (send ?vivienda get-precio_mensual)) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El precio mensual de la vivienda es igual o inferior al precio minimo solicitado"))
            )
        )
    )
    ; METROS CUADRADOS
    (bind ?obligatoriedadMetros2 (fact-slot-value ?obligatoriedad metros2))
    (bind ?metros2 (fact-slot-value ?caracteristicas metros2))
    (switch ?obligatoriedadMetros2
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda get-m2_habitable) ?metros2)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La superficie de la vivienda es inferior a la solicitada"))
                else (if (and (eq ?grado ADECUADO) (>= (send ?vivienda get-m2_habitable) (* ?metros2 1.25))) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] La superficie de la vivienda es al menos un 25% superior a la solicitada"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda get-m2_habitable) ?metros2) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La superficie de la vivienda es igual o superior a la solicitada"))
            )
        )
    )

    ; NUMERO DE DORMITORIOS SIMPLES
    (bind ?obligatoriedadNumDormSimple (fact-slot-value ?obligatoriedad numDormSimple))
    (bind ?numDormSimple (fact-slot-value ?caracteristicas numDormSimple))
    (switch ?obligatoriedadNumDormSimple
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-dorm-simples) ?numDormSimple)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de dormitorios simples de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-dorm-simples) ?numDormSimple)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de dormitorios simples de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-dorm-simples) ?numDormSimple) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de dormitorios simples de la vivienda es igual o superior al solicitado"))
            )
        )
    )
    ; NUMERO DE DORMITORIOS SIMPLES CON ARMARIOS EMPOTRADOS
    (bind ?obligatoriedadNumEmpotradosSimple (fact-slot-value ?obligatoriedad numEmpotradosSimple))
    (bind ?numEmpotradosSimple (fact-slot-value ?caracteristicas numEmpotradosSimple))
    (switch ?obligatoriedadNumEmpotradosSimple
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-empotrados-simples) ?numEmpotradosSimple)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de dormitorios simples con armarios empotrados de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-empotrados-simples) ?numEmpotradosSimple)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de dormitorios simples con armarios empotrados de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-empotrados-simples) ?numEmpotradosSimple) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de dormitorios simples con armarios empotrados de la vivienda es igual o superior al solicitado"))
            )
        )
    )

    ; NUMERO DE DORMITORIOS DOBLE
    (bind ?obligatoriedadNumDormDoble (fact-slot-value ?obligatoriedad numDormDoble))
    (bind ?numDormDoble (fact-slot-value ?caracteristicas numDormDoble))
    (switch ?obligatoriedadNumDormDoble
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-dorm-dobles) ?numDormDoble)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de dormitorios dobles de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-dorm-dobles) ?numDormDoble)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de dormitorios dobles de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-dorm-dobles) ?numDormDoble) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de dormitorios dobles de la vivienda es igual o superior al solicitado"))
            )
        )
    )

    ; NUMERO DE DORMITORIOS DOBLES CON ARMARIOS EMPOTRADOS
    (bind ?obligatoriedadNumEmpotradosDoble (fact-slot-value ?obligatoriedad numEmpotradosDoble))
    (bind ?numEmpotradosDoble (fact-slot-value ?caracteristicas numEmpotradosDoble))
    (switch ?obligatoriedadNumEmpotradosDoble
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-empotrados-dobles) ?numEmpotradosDoble)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de dormitorios dobles con armarios empotrados de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-empotrados-dobles) ?numEmpotradosDoble)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de dormitorios dobles con armarios empotrados de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-empotrados-dobles) ?numEmpotradosDoble) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de dormitorios dobles con armarios empotrados de la vivienda es igual o superior al solicitado"))
            )
        )
    )

    ; NUM BANYOS
    (bind ?obligatoriedadNumBanyos (fact-slot-value ?obligatoriedad numBanyos))
    (bind ?numBanyos (fact-slot-value ?caracteristicas numBanyos))
    (switch ?obligatoriedadNumBanyos
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-banyos) ?numBanyos)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de banyos de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-banyos) ?numBanyos)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de banyos de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-banyos) ?numBanyos) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de banyos de la vivienda es igual o superior al solicitado"))
            )
        )
    )

    ; NUM BANYERAS
    (bind ?obligatoriedadNumBanyeras (fact-slot-value ?obligatoriedad numBanyeras))
    (bind ?numBanyeras (fact-slot-value ?caracteristicas numBanyeras))
    (switch ?obligatoriedadNumBanyeras
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-banyeras) ?numBanyeras)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de banyeras de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-banyeras) ?numBanyeras)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de banyeras de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-banyeras) ?numBanyeras) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de banyeras de la vivienda es igual o superior al solicitado"))
            )
        )
    )

    ; NUM DUCHAS
    (bind ?obligatoriedadNumDuchas (fact-slot-value ?obligatoriedad numDuchas))
    (bind ?numDuchas (fact-slot-value ?caracteristicas numDuchas))
    (switch ?obligatoriedadNumDuchas
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (< (send ?vivienda calcular-num-duchas) ?numDuchas)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El numero de duchas de la vivienda es inferior al solicitado"))
                else (if (and (eq ?grado ADECUADO) (> (send ?vivienda calcular-num-duchas) ?numDuchas)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[+] El numero de duchas de la vivienda es superior al solicitado"))
                )
            )
        )
        (case P then
            (if (>= (send ?vivienda calcular-num-duchas) ?numDuchas) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El numero de duchas de la vivienda es igual o superior al solicitado"))
            )
        )
    )

    ; BALCON
    (bind ?obligatoriedadBalcon (fact-slot-value ?obligatoriedad balcon))
    (bind ?balcon (fact-slot-value ?caracteristicas balcon))
    (switch ?obligatoriedadBalcon
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_balcon) ?balcon)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de balcones no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_balcon) ?balcon) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de balcones coincide con la solicitada"))
            )
        )
    )

    ; TERRAZA
    (bind ?obligatoriedadTerraza (fact-slot-value ?obligatoriedad terraza))
    (bind ?terraza (fact-slot-value ?caracteristicas terraza))
    (switch ?obligatoriedadTerraza
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_terraza) ?terraza)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de terrazas no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_terraza) ?terraza) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de terrazas coincide con la solicitada"))
            )
        )
    )

    ; ASCENSOR
    (bind ?obligatoriedadAscensor (fact-slot-value ?obligatoriedad ascensor))
    (bind ?ascensor (fact-slot-value ?caracteristicas ascensor))
    (switch ?obligatoriedadAscensor
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_ascensor) ?ascensor)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de ascensor no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_ascensor) ?ascensor) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de ascensor coincide con la solicitada"))
            )
        )
    )

    ; PARKING
    (bind ?obligatoriedadParking (fact-slot-value ?obligatoriedad parking))
    (bind ?parking (fact-slot-value ?caracteristicas parking))
    (switch ?obligatoriedadParking
        (case O then
            (if (or (eq (class ?vivienda) Unifamiliar) (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_parking) ?parking))) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de parking no coincide con la solicitada"))
            )
        )
        (case P then
            (if (and (neq (class ?vivienda) Unifamiliar) (eq (send ?vivienda get-has_parking) ?parking)) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de parking coincide con la solicitada"))
            )
        )
    )

    ; GARAJE
    (bind ?obligatoriedadGaraje (fact-slot-value ?obligatoriedad garaje))
    (bind ?garaje (fact-slot-value ?caracteristicas garaje))
    (switch ?obligatoriedadGaraje
        (case O then
            (if (or (neq (class ?vivienda) Unifamiliar) (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_garaje) ?garaje))) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de garaje no coincide con la solicitada"))
            )
        )
        (case P then
            (if (and (eq (class ?vivienda) Unifamiliar) (eq (send ?vivienda get-has_garaje) ?garaje)) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de garaje coincide con la solicitada"))
            )
        )
    )

    ; MASCOTAS
    (bind ?obligatoriedadMascotas (fact-slot-value ?obligatoriedad mascotas))
    (bind ?mascotas (fact-slot-value ?caracteristicas mascotas))
    (switch ?obligatoriedadMascotas
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-mascotas) ?mascotas)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La permision de mascotas no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-mascotas) ?terraza) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La permision de mascotas coincide con la solicitada"))
            )
        )
    )

    ; AIRE ACONDICIONADO
    (bind ?obligatoriedadAire (fact-slot-value ?obligatoriedad aireAcondicionado))
    (bind ?aire (fact-slot-value ?caracteristicas aireAcondicionado))
    (switch ?obligatoriedadAire
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_aire) ?aire)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de aire acondicionado no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_aire) ?aire) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de aire acondicionado coincide con la solicitada"))
            )
        )
    )

    ; CALEFACCION
    (bind ?obligatoriedadCalefaccion (fact-slot-value ?obligatoriedad calefaccion))
    (bind ?calefaccion (fact-slot-value ?caracteristicas calefaccion))
    (switch ?obligatoriedadCalefaccion
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_calefaccion) ?calefaccion)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de calefaccion no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_calefaccion) ?calefaccion) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de calefaccion coincide con la solicitada"))
            )
        )
    )

    ; GAS
    (bind ?obligatoriedadGas (fact-slot-value ?obligatoriedad gas))
    (bind ?gas (fact-slot-value ?caracteristicas gas))
    (switch ?obligatoriedadGas
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-gas) ?gas)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] El tipo de gas no coincide con el solicitado"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-gas) ?gas) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] El tipo de gas coincide con el solicitado"))
            )
        )
    )

    ; MUEBLES
    (bind ?obligatoriedadMuebles (fact-slot-value ?obligatoriedad muebles))
    (bind ?muebles (fact-slot-value ?caracteristicas muebles))
    (switch ?obligatoriedadMuebles
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-muebles) ?muebles)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de muebles no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-muebles) ?muebles) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de muebles coincide con la solicitada"))
            )
        )
    )

    ; ELECTRODOMESTICOS
    (bind ?obligatoriedadElectrodomesticos (fact-slot-value ?obligatoriedad electrodomesticos))
    (bind ?electrodomesticos (fact-slot-value ?caracteristicas electrodomesticos))
    (switch ?obligatoriedadElectrodomesticos
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-electrodomesticos) ?electrodomesticos)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de electrodomesticos no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-electrodomesticos) ?electrodomesticos) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de electrodomesticos coincide con la solicitada"))
            )
        )
    )

    ; SOL
    (bind ?obligatoriedadSol (fact-slot-value ?obligatoriedad sol))
    (bind ?sol (fact-slot-value ?caracteristicas sol))
    (switch ?obligatoriedadSol
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-soleado) ?sol)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La iluminacion solar de la vivienda no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-soleado) ?sol) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La iluminacion solar de la vivienda coincide con la solicitada"))
            )
        )
    )
    ; VISTAS
    (bind ?obligatoriedadVistas (fact-slot-value ?obligatoriedad vistas))
    (bind ?vistas (fact-slot-value ?caracteristicas vistas))
    (switch ?obligatoriedadVistas
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_vistas) ?vistas)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de buenas vistas no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_vistas) ?vistas) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de buenas vistas coincide con la solicitada"))
            )
        )
    )

    ; PISCINA
    (bind ?obligatoriedadPiscina (fact-slot-value ?obligatoriedad piscina))
    (bind ?piscina (fact-slot-value ?caracteristicas piscina))
    (switch ?obligatoriedadPiscina
        (case O then
            (if (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_piscina) ?piscina)) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de piscina no coincide con la solicitada"))
            )
        )
        (case P then
            (if (eq (send ?vivienda get-has_piscina) ?piscina) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de piscina coincide con la solicitada"))
            )
        )
    )

    ; SOTANO
    (bind ?obligatoriedadSotano (fact-slot-value ?obligatoriedad sotano))
    (bind ?sotano (fact-slot-value ?caracteristicas sotano))
    (switch ?obligatoriedadSotano
        (case O then
            (if (or (neq (class ?vivienda) Unifamiliar) (and (eq ?grado PARCIALMENTE-ADECUADO) (neq (send ?vivienda get-has_sotano) ?sotano))) then
                (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] La disponibilidad de sotano no coincide con la solicitada"))
            )
        )
        (case P then
            (if (and (eq (class ?vivienda) Unifamiliar) (eq (send ?vivienda get-has_sotano) ?sotano)) then
                (bind ?puntuacion (+ 1 ?puntuacion))
                (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) "[+] La disponibilidad de sotano coincide con la solicitada"))
            )
        )
    )

    ; SERVICIOS CERCANOS
    (bind ?obligatoriedadServiciosCercanos (fact-slot-value ?obligatoriedad serviciosCercanos))
    (bind $?serviciosCercanos (fact-slot-value ?caracteristicas serviciosCercanos))
    (switch ?obligatoriedadServiciosCercanos
        (case O then 
            (progn$ (?servicioCercanoSolicitado $?serviciosCercanos)
                (if (not (member$ ?servicioCercanoSolicitado $?filtradoServicios)) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] Algun servicio cercano solicitado no se encuentra en las cercanias de la vivienda"))
                    (break)
                )
            )
        )
        (case P then
            (progn$ (?servicioCercanoVivienda $?serviciosCercanosVivienda)
                (if (member$ (upcase (class ?servicioCercanoVivienda)) $?serviciosCercanos) then
                    (bind ?puntuacion (+ 1 ?puntuacion))
                    (bind $?detallesPuntuacion (insert$ $?detallesPuntuacion (+ 1 (length$ $?detallesPuntuacion)) (str-cat "[+] En las cercanias de la vivienda hay un servicio de tipo " (upcase (class ?servicioCercanoVivienda)))))
                )
            )
        )
    )
    ; SERVICIOS LEJANOS
    (bind ?obligatoriedadServiciosLejanos (fact-slot-value ?obligatoriedad serviciosLejanos))
    (bind $?serviciosLejanos (fact-slot-value ?caracteristicas serviciosLejanos))
    (if (eq ?obligatoriedadServiciosLejanos O) then
        (progn$ (?servicioLejanoSolicitado $?serviciosLejanos)
                (if (member$ ?servicioLejanoSolicitado $?filtradoServicios) then
                    (bind $?detallesGrado (insert$ $?detallesGrado (+ 1 (length$ $?detallesGrado)) "[-] Algun servicio lejano solicitado que se encuentra en las cercanias de la vivienda"))
                    (break)
                )
        )
    )

    (if (and (eq ?grado ADECUADO) (> (length$ $?detallesGrado) 0)) then (bind ?grado MUY-RECOMENDABLE))

    (make-instance (sym-cat (instance-name ?vivienda) " Abstracta") of ViviendaAbstracta
        (vivienda ?vivienda)
        (serviciosCercanos (send ?vivienda buscar-servicios-cercanos))
        (grado ?grado)
        (detallesGrado $?detallesGrado)
        (puntuacion ?puntuacion)
        (detallesPuntuacion $?detallesPuntuacion)
    )
    ?puntuacion
)

;========================================================================
;=                              Modulo MAIN                             =
;========================================================================

(defrule MAIN::inicio "Regla con la que inicia el programa"
    (declare (salience 100))
	=>
	(printout t crlf "=============================================" crlf)
    (printout t      "=   Sistema de recomendacion de viviendas   =" crlf)
	(printout t      "=============================================" crlf)
    (bind ?respuesta (pregunta-binaria "- Quiere ejecutar un juego de pruebas? [s | n] "))
    (switch ?respuesta
        (case TRUE then
            (bind ?respuesta (pregunta-opciones-num "- Que juego de prueba quiere ejecutar? [1..7] " 1 2 3 4 5 6 7))
                (switch ?respuesta
                    ; TODO OBLIGATORIO, CARACTERISTICAS ESPECIFICAS DE LA VIVIENDA 1
                    (case 1 then
                        (assert (Perfil
                            (edad 20)
                            (estadoCivil (create$ SOLTERO))
                            (mayores FALSE)
                            (coche FALSE)
                            (trabajaCiudad TRUE)
                            (distritoTrabajo CIUTAT-VELLA))
                        )
                        (assert (Caracteristicas
                            (tipoVivienda PISO)
                            (sotano FALSE)
                            (precioMin 450)
                            (precioMax 450)
                            (metros2 51)
                            (numDormSimple 2)
                            (numEmpotradosSimple 1)
                            (numDormDoble 1)
                            (numEmpotradosDoble 1)
                            (numBanyos 1)
                            (numBanyeras 1)
                            (numDuchas 1)
                            (balcon FALSE)
                            (terraza FALSE)
                            (ascensor TRUE)
                            (parking TRUE)
                            (garaje FALSE)
                            (mascotas TRUE)
                            (serviciosCercanos (create$ COMERCIAL ZONAVERDE TRANSPORTE))
                            (serviciosLejanos (create$ INDUSTRIAL OCIO OFICINA EDUCACION SANIDAD))
                            (aireAcondicionado FALSE)
                            (calefaccion TRUE)
                            (gas BUTANO)
                            (muebles TRUE)
                            (electrodomesticos FALSE)
                            (sol DIA)
                            (vistas TRUE)
                            (piscina TRUE))
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda O)
                            (sotano UNDEF)
                            (precioMin O)
                            (precioMax O)
                            (metros2 O)
                            (numDormSimple O)
                            (numEmpotradosSimple O)
                            (numDormDoble O)
                            (numEmpotradosDoble O)
                            (numBanyos O)
                            (numBanyeras O)
                            (numDuchas O)
                            (balcon O)
                            (terraza O)
                            (ascensor O)
                            (parking O)
                            (garaje UNDEF)
                            (mascotas O)
                            (serviciosLejanos O)
                            (serviciosCercanos O)
                            (aireAcondicionado O)
                            (calefaccion O)
                            (gas O)
                            (muebles O)
                            (electrodomesticos O)
                            (sol O)
                            (vistas O)
                            (piscina O))
                        )
                    )
                    ; TODAS LAS CARACTERISTICAS SON PREFERIBLES
                    (case 2 then
                        (assert (Perfil
                            (edad 21)
                            (estadoCivil (create$ SOLTERO))
                            (mayores FALSE)
                            (coche TRUE)
                            (trabajaCiudad TRUE)
                            (distritoTrabajo CIUTAT-VELLA))
                        )
                        (assert (Caracteristicas
                            (tipoVivienda UNIFAMILIAR)
                            (sotano TRUE)
                            (precioMin 342)
                            (precioMax 675)
                            (metros2 45)
                            (numDormSimple 2)
                            (numEmpotradosSimple 1)
                            (numDormDoble 1)
                            (numEmpotradosDoble 1)
                            (numBanyos 1)
                            (numBanyeras 0)
                            (numDuchas 1)
                            (balcon TRUE)
                            (terraza TRUE)
                            (ascensor TRUE)
                            (parking FALSE)
                            (garaje TRUE)
                            (mascotas TRUE)
                            (serviciosCercanos (create$ OCIO OFICINA))
                            (serviciosLejanos (create$ INDUSTRIAL EDUCACION))
                            (aireAcondicionado TRUE)
                            (calefaccion TRUE)
                            (gas NATURAL)
                            (muebles TRUE)
                            (electrodomesticos TRUE)
                            (sol DIA)
                            (vistas TRUE)
                            (piscina TRUE))
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda P)
                            (sotano P)
                            (precioMin P)
                            (precioMax P)
                            (metros2 P)
                            (numDormSimple P)
                            (numEmpotradosSimple P)
                            (numDormDoble P)
                            (numEmpotradosDoble P)
                            (numBanyos P)
                            (numBanyeras P)
                            (numDuchas P)
                            (balcon P)
                            (terraza P)
                            (ascensor P)
                            (parking UNDEF)
                            (garaje P)
                            (mascotas P)
                            (serviciosLejanos P)
                            (serviciosCercanos P)
                            (aireAcondicionado P)
                            (calefaccion P)
                            (gas P)
                            (muebles P)
                            (electrodomesticos P)
                            (sol P)
                            (vistas P)
                            (piscina P))
                        )
                    )
                    ; TODO INDIFERENTE, SOLO SE ESPECIFICAN LAS CARACTERISTICAS DEL PERFIL
                    (case 3 then
                        (assert (Perfil
                            (edad 21)
                            (estadoCivil (create$ SOLTERO))
                            (mayores TRUE)
                            (coche TRUE)
                            (trabajaCiudad TRUE)
                            (distritoTrabajo GRACIA))
                        )
                        (assert (Caracteristicas)
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda I)
                            (sotano I)
                            (precioMin I)
                            (precioMax I)
                            (metros2 I)
                            (numDormSimple I)
                            (numEmpotradosSimple I)
                            (numDormDoble I)
                            (numEmpotradosDoble I)
                            (numBanyos I)
                            (numBanyeras I)
                            (numDuchas I)
                            (balcon I)
                            (terraza I)
                            (ascensor I)
                            (parking I)
                            (garaje I)
                            (mascotas I)
                            (serviciosLejanos I)
                            (serviciosCercanos I)
                            (aireAcondicionado I)
                            (calefaccion I)
                            (gas I)
                            (muebles I)
                            (electrodomesticos I)
                            (sol I)
                            (vistas I)
                            (piscina I))
                        )
                    )
                    ; EJECUCION DONDE SE IMPONE RESTRICCION SOBRE VIVIENDAS UNIFAMILIARES
                    (case 4 then
                        (assert (Perfil
                            (edad 40)
                            (estadoCivil (create$ SOLTERO HIJOS))
                            (mayores FALSE)
                            (coche TRUE)
                            (trabajaCiudad TRUE)
                            (distritoTrabajo SANT-ANDREU))
                        )
                        (assert (Caracteristicas
                            (tipoVivienda UNIFAMILIAR)
                            (sotano TRUE)
                            (precioMin 100)
                            (precioMax 700)
                            (metros2 50)
                            (numDormSimple 2)
                            (numEmpotradosSimple 1)
                            (numDormDoble 1)
                            (numEmpotradosDoble 1)
                            (numBanyos 2)
                            (numBanyeras 1)
                            (numDuchas 1)
                            (balcon FALSE)
                            (terraza TRUE)
                            (ascensor FALSE)
                            (parking FALSE)
                            (garaje TRUE)
                            (mascotas TRUE)
                            (serviciosCercanos (create$ EDUCACION OCIO))
                            (serviciosLejanos (create$))
                            (aireAcondicionado TRUE)
                            (calefaccion TRUE)
                            (gas NATURAL)
                            (muebles TRUE)
                            (electrodomesticos TRUE)
                            (sol MANYANA)
                            (vistas TRUE)
                            (piscina TRUE))
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda O)
                            (sotano P)
                            (precioMin P)
                            (precioMax O)
                            (metros2 O)
                            (numDormSimple P)
                            (numEmpotradosSimple P)
                            (numDormDoble O)
                            (numEmpotradosDoble P)
                            (numBanyos O)
                            (numBanyeras P)
                            (numDuchas P)
                            (balcon P)
                            (terraza P)
                            (ascensor I)
                            (parking UNDEF)
                            (garaje O)
                            (mascotas P)
                            (serviciosLejanos I)
                            (serviciosCercanos O)
                            (aireAcondicionado P)
                            (calefaccion P)
                            (gas P)
                            (muebles P)
                            (electrodomesticos P)
                            (sol P)
                            (vistas P)
                            (piscina P))
                        )
                    )
                     
                    ; EJECUCION DONDE SE IMPONE RESTRICCION SOBRE PISOS
                    (case 5 then
                        (assert (Perfil
                            (edad 21)
                            (estadoCivil (create$ SOLTERO))
                            (mayores FALSE)
                            (coche TRUE)
                            (trabajaCiudad TRUE)
                            (distritoTrabajo CIUTAT-VELLA))
                        )
                        (assert (Caracteristicas
                            (tipoVivienda PISO)
                            (sotano UNDEF)
                            (precioMin 0)
                            (precioMax 800)
                            (metros2 30)
                            (numDormSimple 2)
                            (numEmpotradosSimple 1)
                            (numDormDoble 1)
                            (numEmpotradosDoble 1)
                            (numBanyos 1)
                            (numBanyeras 0)
                            (numDuchas 1)
                            (balcon TRUE)
                            (terraza TRUE)
                            (ascensor TRUE)
                            (parking TRUE)
                            (garaje FALSE)
                            (mascotas FALSE)
                            (serviciosCercanos (create$ ZONAVERDE))
                            (serviciosLejanos (create$ INDUSTRIAL))
                            (aireAcondicionado TRUE)
                            (calefaccion TRUE)
                            (gas NATURAL)
                            (muebles TRUE)
                            (electrodomesticos TRUE)
                            (sol DIA)
                            (vistas TRUE)
                            (piscina TRUE))
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda O)
                            (sotano UNDEF)
                            (precioMin O)
                            (precioMax O)
                            (metros2 O)
                            (numDormSimple O)
                            (numEmpotradosSimple P)
                            (numDormDoble O)
                            (numEmpotradosDoble P)
                            (numBanyos O)
                            (numBanyeras P)
                            (numDuchas O)
                            (balcon P)
                            (terraza P)
                            (ascensor P)
                            (parking P)
                            (garaje UNDEF)
                            (mascotas P)
                            (serviciosLejanos P)
                            (serviciosCercanos O)
                            (aireAcondicionado P)
                            (calefaccion O)
                            (gas P)
                            (muebles P)
                            (electrodomesticos P)
                            (sol P)
                            (vistas P)
                            (piscina P))
                        )
                    )
                    ; EJECUCION DONDE SE IMPONE RESTRICCION SOBRE DUPLEX
                    (case 6 then
                        (assert (Perfil
                            (edad 21)
                            (estadoCivil (create$ SOLTERO))
                            (mayores FALSE)
                            (coche TRUE)
                            (trabajaCiudad FALSE)
                            (distritoTrabajo UNDEF))
                        )
                        (assert (Caracteristicas
                            (tipoVivienda DUPLEX)
                            (sotano UNDEF)
                            (precioMin 400)
                            (precioMax 500)
                            (metros2 23)
                            (numDormSimple 1)
                            (numEmpotradosSimple 1)
                            (numDormDoble 1)
                            (numEmpotradosDoble 0)
                            (numBanyos 1)
                            (numBanyeras 1)
                            (numDuchas 1)
                            (balcon TRUE)
                            (terraza TRUE)
                            (ascensor TRUE)
                            (parking FALSE)
                            (garaje UNDEF)
                            (mascotas TRUE)
                            (serviciosCercanos (create$ OCIO OFICINA TRANSPORTE))
                            (serviciosLejanos (create$ INDUSTRIAL))
                            (aireAcondicionado TRUE)
                            (calefaccion TRUE)
                            (gas NATURAL)
                            (muebles FALSE)
                            (electrodomesticos TRUE)
                            (sol DIA)
                            (vistas TRUE)
                            (piscina TRUE))
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda O)
                            (sotano UNDEF)
                            (precioMin O)
                            (precioMax O)
                            (metros2 O)
                            (numDormSimple O)
                            (numEmpotradosSimple P)
                            (numDormDoble O)
                            (numEmpotradosDoble P)
                            (numBanyos O)
                            (numBanyeras O)
                            (numDuchas O)
                            (balcon P)
                            (terraza P)
                            (ascensor P)
                            (parking I)
                            (garaje UNDEF)
                            (mascotas P)
                            (serviciosLejanos P)
                            (serviciosCercanos P)
                            (aireAcondicionado P)
                            (calefaccion P)
                            (gas P)
                            (muebles P)
                            (electrodomesticos P)
                            (sol P)
                            (vistas P)
                            (piscina P))
                        )
                    )
                    ; EJECUCION SIN RECOMENDACIONES
                    (case 7 then
                        (assert (Perfil
                            (edad 21)
                            (estadoCivil (create$ SOLTERO))
                            (mayores FALSE)
                            (coche TRUE)
                            (trabajaCiudad FALSE)
                            (distritoTrabajo UNDEF))
                        )
                        (assert (Caracteristicas
                            (tipoVivienda UNIFAMILIAR)
                            (sotano FALSE)
                            (precioMin 500)
                            (precioMax 700)
                            (metros2 100)
                            (numDormSimple 2)
                            (numEmpotradosSimple 2)
                            (numDormDoble 2)
                            (numEmpotradosDoble 2)
                            (numBanyos 2)
                            (numBanyeras 1)
                            (numDuchas 1)
                            (balcon TRUE)
                            (terraza TRUE)
                            (ascensor FALSE)
                            (parking UNDEF)
                            (garaje TRUE)
                            (mascotas TRUE)
                            (serviciosCercanos (create$ OCIO OFICINA TRANSPORTE ZONAVERDE COMERCIAL))
                            (serviciosLejanos (create$ INDUSTRIAL))
                            (aireAcondicionado TRUE)
                            (calefaccion TRUE)
                            (gas NATURAL)
                            (muebles FALSE)
                            (electrodomesticos TRUE)
                            (sol DIA)
                            (vistas TRUE)
                            (piscina TRUE))
                        )
                        (assert (Obligatoriedad
                            (tipoVivienda O)
                            (sotano O)
                            (precioMin O)
                            (precioMax O)
                            (metros2 O)
                            (numDormSimple O)
                            (numEmpotradosSimple P)
                            (numDormDoble O)
                            (numEmpotradosDoble P)
                            (numBanyos O)
                            (numBanyeras P)
                            (numDuchas P)
                            (balcon I)
                            (terraza O)
                            (ascensor P)
                            (parking UNDEF)
                            (garaje O)
                            (mascotas P)
                            (serviciosLejanos O)
                            (serviciosCercanos I)
                            (aireAcondicionado P)
                            (calefaccion I)
                            (gas O)
                            (muebles P)
                            (electrodomesticos P)
                            (sol P)
                            (vistas P)
                            (piscina P))
                        )
                    )
                )
        )
        (case FALSE then
            (printout t "Por favor, responda a las siguientes preguntas:" crlf)
        )
    )
    (focus PREGUNTAS)
)

;========================================================================
;=                          Modulo PREGUNTAS                            =
;========================================================================

(defrule PREGUNTAS::preguntar-edad
    (not(Perfil))
    =>
    (bind ?respuesta (pregunta-numerica-rango "- Que edad tiene? " 16 100))
    (assert (Perfil (edad ?respuesta)))
)

(defrule PREGUNTAS::preguntar-estado-civil
    ?x <- (Perfil (estadoCivil $?estadoCivil))
    (test (eq $?estadoCivil (create$ UNDEF)))
    =>
    (bind $?respuesta (pregunta-multirespuesta "- Cual es su estado civil? [(p)areja | (s)oltero | (d)ivorciado | con (h)ijos] " p s d h))
    (bind $?estado (create$))
    (progn$ (?elemento $?respuesta)
        (if (and (eq ?elemento p) (not (member$ PAREJA $?estado))) then
            (bind $?estado (insert$ $?estado (+ 1 (length$ $?estado)) PAREJA))
            else (if (and (eq ?elemento s) (not (member$ SOLTERO $?estado))) then
                (bind $?estado (insert$ $?estado (+ 1 (length$ $?estado)) SOLTERO))
                else (if (and (eq ?elemento d) (not (member$ DIVORCIADO $?estado))) then
                    (bind $?estado (insert$ $?estado (+ 1 (length$ $?estado)) DIVORCIADO))
                    else (if (and (eq ?elemento h) (not (member$ HIJOS $?estado))) then
                        (bind $?estado (insert$ $?estado (+ 1 (length$ $?estado)) HIJOS))
                    )
                )
            )
        )
    )
    (modify ?x (estadoCivil $?estado))
)

(defrule PREGUNTAS::preguntar-personas-mayores
    ?x <- (Perfil (mayores ?var))
    (test (eq ?var UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Esta a cargo de personas mayores? [s | n] "))
    (modify ?x (mayores ?respuesta))
)

(defrule PREGUNTAS::preguntar-coche
    ?x <- (Perfil (coche ?var))
    (test (eq ?var UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Tiene coche? [s | n] "))
    (modify ?x (coche ?respuesta))
)

(defrule PREGUNTAS::preguntar-ciudad
    ?x <- (Perfil (trabajaCiudad ?var))
    (test (eq ?var UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Trabaja en la ciudad de Barcelona? [s | n] "))
    (modify ?x (trabajaCiudad ?respuesta))
)
;CIUTAT-VELLA EIXAMPLE GRACIA HORTA-GUINARDO LES-CORTS NOU-BARRIS SANT-ANDREU SANT-MARTI SANTS-MONTJUIC SARRIA-SANT-GERVASI
(defrule PREGUNTAS::preguntar-distrito-trabajo
    ?x <- (Perfil (trabajaCiudad ?var2) (distritoTrabajo ?var))
    (test (eq ?var2 TRUE))
    (test (eq ?var UNDEF))
    =>
    (printout t "Ha indicado que trabaja en Barcelona." crlf)
    (printout t "Sabiendo que los distritos en Barcelona son:" crlf)
    (printout t "[a] Ciutat Vella   [b] Eixample        [c] Sants-Montjuic   [d] Les Corts    [e] Sarria-Sant Gervasi" crlf)
    (printout t "[f] Gracia         [g] Horta-Guinardo  [h] Nou Barris        [i] Sant Andreu  [j] Sant Marti" crlf)
    (bind ?respuesta (pregunta-opciones "- En que distrito trabaja? " a b c d e f g h i j))
    (bind ?ciudad UNDEF)
    (switch ?respuesta
        (case a then (modify ?x (distritoTrabajo CIUTAT-VELLA)))
        (case b then (modify ?x (distritoTrabajo EIXAMPLE)))
        (case c then (modify ?x (distritoTrabajo SANTS-MONTJUIC)))
        (case d then (modify ?x (distritoTrabajo LES-CORTS)))
        (case e then (modify ?x (distritoTrabajo SARRIA-SANT-GERVASI)))
        (case f then (modify ?x (distritoTrabajo GRACIA)))
        (case g then (modify ?x (distritoTrabajo HORTA-GUINARDO)))
        (case h then (modify ?x (distritoTrabajo NOU-BARRIS)))
        (case i then (modify ?x (distritoTrabajo SANT-ANDREU)))
        (case j then (modify ?x (distritoTrabajo SANT-MARTI)))      
    )
)

(defrule PREGUNTAS::preguntar-tipo-vivienda
    (Perfil)
    (not (Caracteristicas))
    (not (Obligatoriedad))
    =>
    (printout t "A continuacion se le haran preguntas sobre las diferentes caracteristicas de las viviendas" crlf)
    (printout t "Para cada caracteristica, se le preguntara tambien su grado de obligatoriedad, los cuales pueden ser:" crlf)
    (printout t "[(o)bligatorio | (p)referente | (i)ndiferente]" crlf)
    (bind ?respuesta (pregunta-opciones "- Que tipo de vivienda esta buscando? [(u)nifamiliar | (p)iso | (d)uplex] " u p d))
    (bind ?parking UNDEF)
    (bind ?garaje UNDEF)
    (switch ?respuesta
        (case u then (bind ?tipo UNIFAMILIAR) (bind ?parking FALSE))
        (case p then (bind ?tipo PISO) (bind ?garaje FALSE))
        (case d then (bind ?tipo DUPLEX) (bind ?garaje FALSE))
    )
    (assert (Caracteristicas (tipoVivienda ?tipo) (parking ?parking) (garaje ?garaje)))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (assert (Obligatoriedad (tipoVivienda (upcase ?respuesta))))
)

(defrule PREGUNTAS::preguntar-precio-minimo
    (Perfil)
    ?x <- (Caracteristicas (precioMin ?precioMin))
    (test (< ?precioMin 0))
    ?y <- (Obligatoriedad (precioMin ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-minimo "- Cual es el precio mensual minimo que esta dispuesto/a a pagar? " 0))
    (modify ?x (precioMin ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (precioMin (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-precio-maximo
    (Perfil)
    ?x <- (Caracteristicas (precioMin ?precioMin) (precioMax ?precioMax))
    (test (>= ?precioMin 0))
    (test (< ?precioMax 0))
    ?y <- (Obligatoriedad (precioMax ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-minimo "- Cual es el precio mensual maximo que esta dispuesto/a a pagar? " ?precioMin))
    (modify ?x (precioMax ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (precioMax (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-metros-cuadrados
    (Perfil)
    ?x <- (Caracteristicas (metros2 ?m2))
    (test (< ?m2 0))
    ?y <- (Obligatoriedad (metros2 ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-minimo "- Cuantos metros cuadrados quiere que tenga aproximadamente como minimo? " 0))
    (modify ?x (metros2 ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (metros2 (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-numero-dormitorios-simples
    (Perfil)
    ?x <- (Caracteristicas (numDormSimple ?nDS))
    (test (< ?nDS 0))
    ?y <- (Obligatoriedad (numDormSimple ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-minimo "- Cuantos dormitorios simples quiere como minimo? " 0))
    (modify ?x (numDormSimple ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numDormSimple (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-numero-armarios-empotrados-simples
    (Perfil)
    ?x <- (Caracteristicas (numDormSimple ?nDS) (numEmpotradosSimple ?nES))
    (test (> ?nDS 0))
    (test (< ?nES 0))
    ?y <- (Obligatoriedad (numEmpotradosSimple ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-rango "- De estos dormitorios, cuantos quiere con armarios empotrados como minimo? " 0 ?nDS))
    (modify ?x (numEmpotradosSimple ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numEmpotradosSimple (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-numero-dormitorios-dobles
    (Perfil)
    ?x <- (Caracteristicas (numDormDoble ?nDD))
    (test (< ?nDD 0))
    ?y <- (Obligatoriedad (numDormDoble ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-minimo "- Cuantos dormitorios dobles quiere como minimo? " 0))
    (modify ?x (numDormDoble ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numDormDoble (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-numero-armarios-empotrados-dobles
    (Perfil)
    ?x <- (Caracteristicas (numDormDoble ?nDD) (numEmpotradosDoble ?nED))
    (test (> ?nDD 0))
    (test (< ?nED 0))
    ?y <- (Obligatoriedad (numEmpotradosDoble ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-rango "- De estos dormitorios, cuantos quiere con armarios empotrados como minimo? " 0 ?nDD))
    (modify ?x (numEmpotradosDoble ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numEmpotradosDoble (upcase ?respuesta)))
)


(defrule PREGUNTAS::preguntar-numero-numBanyos
    (Perfil)
    ?x <- (Caracteristicas (numBanyos ?nB))
    (test (< ?nB 0))
    ?y <- (Obligatoriedad (numBanyos ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-minimo "- Cuantos banyos quiere como minimo? " 0))
    (modify ?x (numBanyos ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numBanyos (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-numero-numBanyeras
    (Perfil)
    ?x <- (Caracteristicas (numBanyos ?nBanyos) (numBanyeras ?nBanyeras))
    (test (> ?nBanyos 0))
    (test (< ?nBanyeras 0))
    ?y <- (Obligatoriedad (numBanyeras ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-rango "- De estos banyos, cuantos quiere con banyera como minimo? " 0 ?nBanyos))
    (modify ?x (numBanyeras ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numBanyeras (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-numero-numDuchas
    (Perfil)
    ?x <- (Caracteristicas (numBanyos ?nBanyos) (numDuchas ?nDuchas))
    (test (> ?nBanyos 0))
    (test (< ?nDuchas 0))
    ?y <- (Obligatoriedad (numDuchas ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-numerica-rango "- De estos banyos, cuantos quiere con ducha como minimo? " 0 ?nBanyos))
    (modify ?x (numDuchas ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (numDuchas (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-balcon
    (Perfil)
    ?x <- (Caracteristicas (balcon ?balcon))
    (test (eq ?balcon UNDEF))
    ?y <- (Obligatoriedad (balcon ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con balcones? [s | n] "))
    (modify ?x (balcon ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (balcon (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-terraza
    (Perfil)
    ?x <- (Caracteristicas (terraza ?terraza))
    (test (eq ?terraza UNDEF))
    ?y <- (Obligatoriedad (terraza ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con terrazas? [s | n] "))
    (modify ?x (terraza ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (terraza (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-parking
    (Perfil)
    ?x <- (Caracteristicas (tipoVivienda ?tipo) (parking ?parking))
    (test (or (eq ?tipo DUPLEX) (eq ?tipo PISO)))
    (test (eq ?parking UNDEF))
    ?y <- (Obligatoriedad (parking ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda plurifamiliar con parking? [s | n] "))
    (modify ?x (parking ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (parking (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-garaje
    (Perfil)
    ?x <- (Caracteristicas (tipoVivienda ?tipo) (garaje ?garaje))
    (test (eq UNIFAMILIAR ?tipo))
    (test (eq ?garaje UNDEF))
    ?y <- (Obligatoriedad (garaje ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda unifamiliar con garaje? [s | n] "))
    (modify ?x (garaje ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (garaje (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-sotano
    (Perfil)
    ?x <- (Caracteristicas (tipoVivienda ?tipo) (sotano ?sotano))
    (test (eq UNIFAMILIAR ?tipo))
    (test (eq ?sotano UNDEF))
    ?y <- (Obligatoriedad (sotano ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda unifamiliar con sotano? [s | n] "))
    (modify ?x (sotano ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (sotano (upcase ?respuesta)))
)


(defrule PREGUNTAS::preguntar-ascensor
    (Perfil)
    ?x <- (Caracteristicas (ascensor ?ascensor))
    (test (eq ?ascensor UNDEF))
    ?y <- (Obligatoriedad (ascensor ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con ascensor? [s | n] "))
    (modify ?x (ascensor ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (ascensor (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-mascotas
    (Perfil)
    ?x <- (Caracteristicas (mascotas ?mascotas))
    (test (eq ?mascotas UNDEF))
    ?y <- (Obligatoriedad (mascotas ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda donde se permitan mascotas? [s | n] "))
    (modify ?x (mascotas ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (mascotas (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-gas
    (Perfil)
    ?x <- (Caracteristicas (gas ?gas))
    (test (eq ?gas UNDEF))
    ?y <- (Obligatoriedad (gas ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-opciones "- Quiere una vivienda con gas natural o butano? [(n)atural | (b)utano] " n b))
    (if (eq ?respuesta n) then (bind ?gas NATURAL) else (bind ?gas BUTANO))
    (modify ?x (gas ?gas))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (gas (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-aire-acondicionado
    (Perfil)
    ?x <- (Caracteristicas (aireAcondicionado ?aire))
    (test (eq ?aire UNDEF))
    ?y <- (Obligatoriedad (aireAcondicionado ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda que disponga de aire acondicionado? [s | n] "))
    (modify ?x (aireAcondicionado ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (aireAcondicionado (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-calefaccion
    (Perfil)
    ?x <- (Caracteristicas (calefaccion ?calefaccion))
    (test (eq ?calefaccion UNDEF))
    ?y <- (Obligatoriedad (calefaccion ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda que disponga de calefaccion? [s | n] "))
    (modify ?x (calefaccion ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (calefaccion (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-muebles
    (Perfil)
    ?x <- (Caracteristicas (muebles ?muebles))
    (test (eq ?muebles UNDEF))
    ?y <- (Obligatoriedad (muebles ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda amueblada? [s | n] "))
    (modify ?x (muebles ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (muebles (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-electrodomesticos
    (Perfil)
    ?x <- (Caracteristicas (electrodomesticos ?electrodomesticos))
    (test (eq ?electrodomesticos UNDEF))
    ?y <- (Obligatoriedad (electrodomesticos ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con electrodomesticos? [s | n] "))
    (modify ?x (electrodomesticos ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (electrodomesticos (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-piscina
    (Perfil)
    ?x <- (Caracteristicas (tipoVivienda ?tipo) (piscina ?piscina))
    (test (eq ?piscina UNDEF))
    ?y <- (Obligatoriedad (piscina ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (if (eq ?tipo UNIFAMILIAR) then (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con piscina? [s | n] "))
        else (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con piscina comunitaria? [s | n] "))
    )
    (modify ?x (piscina ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (piscina (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-sol
    (Perfil)
    ?x <- (Caracteristicas (sol ?sol))
    (test (eq ?sol UNDEF))
    ?y <- (Obligatoriedad (sol ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-opciones "- Quiere una vivienda soleada por la manyana, por la tarde, o todo el dia? [(m)anyana | (t)arde | (d)ia] " m t d))
    (if (eq ?respuesta m) then (bind ?sol MANYANA) else (if (eq ?respuesta t) then (bind ?sol TARDE) else (bind ?sol DIA)))
    (modify ?x (sol ?sol))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (sol (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-vistas
    (Perfil)
    ?x <- (Caracteristicas (vistas ?vistas))
    (test (eq ?vistas UNDEF))
    ?y <- (Obligatoriedad (vistas ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind ?respuesta (pregunta-binaria "- Quiere una vivienda con buenas vistas? [s | n] "))
    (modify ?x (vistas ?respuesta))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (vistas (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-servicios-cercanos
    (Perfil)
    ?x <- (Caracteristicas (serviciosCercanos $?serviciosCercanos))
    (test (eq $?serviciosCercanos (create$ UNDEF)))
    ?y <- (Obligatoriedad (serviciosCercanos ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (printout t "Los servicios que hay disponibles son: (i)ndustrial (o)cio o(f)icina (e)ducacion (z)onaverde (s)anidad (t)ransporte (c)omercial" crlf)
    (bind $?respuesta (pregunta-multirespuesta "- Que servicios prefiere tener cerca? " i o f e z s t c))
    (bind $?servicios (create$))
    (if (member$ i $?respuesta) then (bind $?servicios (insert$ $?servicios 1 INDUSTRIAL)))
    (if (member$ o $?respuesta) then (bind $?servicios (insert$ $?servicios 1 OCIO)))
    (if (member$ f $?respuesta) then (bind $?servicios (insert$ $?servicios 1 OFICINA)))
    (if (member$ e $?respuesta) then (bind $?servicios (insert$ $?servicios 1 EDUCACION)))
    (if (member$ z $?respuesta) then (bind $?servicios (insert$ $?servicios 1 ZONAVERDE)))
    (if (member$ s $?respuesta) then (bind $?servicios (insert$ $?servicios 1 SANIDAD)))
    (if (member$ t $?respuesta) then (bind $?servicios (insert$ $?servicios 1 TRANSPORTE)))
    (if (member$ c $?respuesta) then (bind $?servicios (insert$ $?servicios 1 COMERCIAL)))
    (modify ?x (serviciosCercanos $?servicios))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (serviciosCercanos (upcase ?respuesta)))
)

(defrule PREGUNTAS::preguntar-servicios-lejanos
    (Perfil)
    ?x <- (Caracteristicas (serviciosLejanos $?serviciosLejanos))
    (test (eq $?serviciosLejanos (create$ UNDEF)))
    ?y <- (Obligatoriedad (serviciosLejanos ?obligatoriedad))
    (test (eq ?obligatoriedad UNDEF))
    =>
    (bind $?respuesta (pregunta-multirespuesta "- Que servicios prefiere tener lejos? " i o f e z s t c))
    (bind $?servicios (create$))
    (if (member$ i $?respuesta) then (bind $?servicios (insert$ $?servicios 1 INDUSTRIAL)))
    (if (member$ o $?respuesta) then (bind $?servicios (insert$ $?servicios 1 OCIO)))
    (if (member$ f $?respuesta) then (bind $?servicios (insert$ $?servicios 1 OFICINA)))
    (if (member$ e $?respuesta) then (bind $?servicios (insert$ $?servicios 1 EDUCACION)))
    (if (member$ z $?respuesta) then (bind $?servicios (insert$ $?servicios 1 ZONAVERDE)))
    (if (member$ s $?respuesta) then (bind $?servicios (insert$ $?servicios 1 SANIDAD)))
    (if (member$ t $?respuesta) then (bind $?servicios (insert$ $?servicios 1 TRANSPORTE)))
    (if (member$ c $?respuesta) then (bind $?servicios (insert$ $?servicios 1 COMERCIAL)))
    (modify ?x (serviciosLejanos $?servicios))
    (bind ?respuesta (pregunta-opciones "- Cual es su grado de obligatoriedad? " o p i))
    (modify ?y (serviciosLejanos (upcase ?respuesta)))
)

(defrule PREGUNTAS::cambio-modulo-abstraccion
    (Perfil)
    (Caracteristicas)
    (Obligatoriedad)
    =>
    (focus ABSTRACCION)
)

;========================================================================
;=                         Modulo ABSTRACCION                           =
;========================================================================

(defrule ABSTRACCION::seleccion-viviendas
    ?perfil <- (Perfil)
    ?caracteristicas <- (Caracteristicas)
    ?obligatoriedad <- (Obligatoriedad)
    (not (ViviendaAbstracta))
    =>
    (bind $?listaViviendas (find-all-instances ((?vivienda Vivienda)) TRUE))
    (progn$ (?vivienda $?listaViviendas)
        (bind ?incumplidas (comprobar-restricciones ?vivienda ?caracteristicas ?obligatoriedad))
        (if (<= ?incumplidas 2) then
            (bind ?grado ADECUADO)
            (if (> ?incumplidas 0) then (bind ?grado PARCIALMENTE-ADECUADO))
            (bind ?puntuacion (crear-vivienda-abstracta ?vivienda ?perfil ?caracteristicas ?obligatoriedad ?grado))
        )
    )
)

(defrule ABSTRACCION::cambio-modulo-solucion
    (declare (salience -1))
    =>
    (focus SOLUCION)
)

;========================================================================
;=                           Modulo SOLUCION                            =
;========================================================================

(defrule SOLUCION::imprimir-solucion
    (declare (salience -1))
    =>
    (bind ?found FALSE)
    (bind $?listaViviendasAbstractas (find-all-instances ((?viviendaAbstracta ViviendaAbstracta)) (eq (send ?viviendaAbstracta get-grado) MUY-RECOMENDABLE)))
    (if (> (length$ $?listaViviendasAbstractas) 0) then
        (bind ?found TRUE)
        (printout t crlf "=============================================" crlf)
        (printout t      "=        VIVIENDAS MUY RECOMENDABLES        =" crlf)
        (printout t      "=============================================" crlf)
        (bind ?contador 0)
        (while (and (< ?contador 5) (neq (length$ $?listaViviendasAbstractas) 0)) do
            (bind ?viviendaMaxPuntuacion (nth$ 1 $?listaViviendasAbstractas))
            (bind ?i 2)
            (while (<= ?i (length$ $?listaViviendasAbstractas)) do
                (if (> (send (nth$ ?i $?listaViviendasAbstractas) get-puntuacion) (send ?viviendaMaxPuntuacion get-puntuacion)) then (bind ?viviendaMaxPuntuacion (nth$ ?i $?listaViviendasAbstractas)))
                (bind ?i (+ ?i 1))
            )
            (bind $?listaViviendasAbstractas (delete-member$ $?listaViviendasAbstractas ?viviendaMaxPuntuacion))
            (send ?viviendaMaxPuntuacion print)
            (printout t crlf)
            (bind ?contador (+ 1 ?contador))
        )
    )
    
    (bind $?listaViviendasAbstractas (find-all-instances ((?viviendaAbstracta ViviendaAbstracta)) (eq (send ?viviendaAbstracta get-grado) ADECUADO)))
    (if (> (length$ $?listaViviendasAbstractas) 0) then
        (bind ?found TRUE)
        (printout t crlf "=============================================" crlf)
        (printout t      "=            VIVIENDAS ADECUADAS            =" crlf)
        (printout t      "=============================================" crlf)
        (bind ?contador 0)
        (while (and (< ?contador 5) (neq (length$ $?listaViviendasAbstractas) 0)) do
            (bind ?viviendaMaxPuntuacion (nth$ 1 $?listaViviendasAbstractas))
            (bind ?i 2)
            (while (<= ?i (length$ $?listaViviendasAbstractas)) do
                (if (> (send (nth$ ?i $?listaViviendasAbstractas) get-puntuacion) (send ?viviendaMaxPuntuacion get-puntuacion)) then (bind ?viviendaMaxPuntuacion (nth$ ?i $?listaViviendasAbstractas)))
                (bind ?i (+ ?i 1))
            )
            (bind $?listaViviendasAbstractas (delete-member$ $?listaViviendasAbstractas ?viviendaMaxPuntuacion))
            (send ?viviendaMaxPuntuacion print)
            (printout t crlf)
            (bind ?contador (+ 1 ?contador))
        )
    )
    (bind $?listaViviendasAbstractas (find-all-instances ((?viviendaAbstracta ViviendaAbstracta)) (eq (send ?viviendaAbstracta get-grado) PARCIALMENTE-ADECUADO)))
    (if (> (length$ $?listaViviendasAbstractas) 0) then
        (bind ?found TRUE)
        (printout t crlf "=============================================" crlf)
        (printout t      "=     VIVIENDAS PARCIALMENTE ADECUADAS      =" crlf)
        (printout t      "=============================================" crlf)
        (bind ?contador 0)
        (while (and (< ?contador 5) (neq (length$ $?listaViviendasAbstractas) 0)) do
            (bind ?viviendaMaxPuntuacion (nth$ 1 $?listaViviendasAbstractas))
            (bind ?i 2)
            (while (<= ?i (length$ $?listaViviendasAbstractas)) do
                (if (> (send (nth$ ?i $?listaViviendasAbstractas) get-puntuacion) (send ?viviendaMaxPuntuacion get-puntuacion)) then (bind ?viviendaMaxPuntuacion (nth$ ?i $?listaViviendasAbstractas)))
                (bind ?i (+ ?i 1))
            )
            (bind $?listaViviendasAbstractas (delete-member$ $?listaViviendasAbstractas ?viviendaMaxPuntuacion))
            (send ?viviendaMaxPuntuacion print)
            (printout t crlf)
            (bind ?contador (+ 1 ?contador))
        )
    )
    (if (eq ?found FALSE) then (printout t "No se han encontrado viviendas que cumplan los criterios especificados" crlf))
)
