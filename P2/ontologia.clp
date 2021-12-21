(defclass Localizacion "Clase que representa una localizacion"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; direccion de la localizacion
    (slot direccion
        (type STRING)
        (create-accessor read-write))
    ;;; el distrito de la ciudad donde se encuentra la localizacion
    (slot distrito_ciudad
        (type SYMBOL)
        (create-accessor read-write))
    ;;; coordenada y de la localizacion
    (slot latitud_y
        (type INTEGER)
        (create-accessor read-write))
    ;;; coordenada x de la localizacion
    (slot longitud_x
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Servicio "Clase que representa un servicio"
    (is-a Localizacion)
    (role concrete)
    (pattern-match reactive)
)

(defclass Comercial "Servicio comercial"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Educacion "Servicio area de la educacion"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Ocio "Servicio area del ocio"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Oficina "Servicio area de oficina"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Sanidad "Servicio area sanitaria"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Transporte "Servicio transporte publico"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass ZonaVerde "Servicio dde zona verde"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Industrial "Servicio area industrial"
    (is-a Servicio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Vivienda "Clase que representa la vivienda"
    (is-a Localizacion)
    (role concrete)
    (pattern-match reactive)
    ;;; vivienda tiene dormitorios
    (multislot tiene_dormitorio
        (type INSTANCE)
        (create-accessor read-write))
    ;;; vivienda tiene banyos
    (multislot tiene_banyos
        (type INSTANCE)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene aire acondicionado
    (slot has_aire
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene balcon
    (slot has_balcon
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene calefaccion
    (slot has_calefaccion
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene terraza
    (slot has_terraza
        (type SYMBOL)
        (create-accessor read-write))
    ;;; metros cuadrados habitables de la vivienda
    (slot m2_habitable
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene electrodomesticos instalados
    (slot electrodomesticos
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si el gas de la vivienda es butano o natural
    (slot gas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene ascensor
    (slot has_ascensor
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene piscina
    (slot has_piscina
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene vistas
    (slot has_vistas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda permite o no tener mascotas
    (slot mascotas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda est amueblada
    (slot muebles
        (type SYMBOL)
        (create-accessor read-write))
    ;;; precio mensual de la vivienda
    (slot precio_mensual
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica el momento que la vivienda esta soleado
    (slot soleado
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Unifamiliar "Vivienda de tipo unifamiliar"
    (is-a Vivienda)
    (role concrete)
    (pattern-match reactive)
    ;;; indica si, en caso de que la vivienda sea unifamiliar, si tiene garaje
    (slot has_garaje
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica, en el caso de una vivienda unifamiliar, si tiene sotano
    (slot has_sotano
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Duplex "Vivienda de tipo duplex"
    (is-a Vivienda)
    (role concrete)
    (pattern-match reactive)
    ;;; altura del piso
    (slot altura
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica si, en caso de que la vivienda sea duplex o piso, tiene un parking
    (slot has_parking
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Piso "Vivienda de tipo piso"
    (is-a Vivienda)
    (role concrete)
    (pattern-match reactive)
    ;;; altura del piso
    (slot altura
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica si, en caso de que la vivienda sea duplex o piso, tiene un parking
    (slot has_parking
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Dormitorio "Clase que representa un dormitorio"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; indica si el dormitortio tiene un armario empotrado
    (slot armario_empotrado
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Doble "Clase que representa un dormitorio doble"
    (is-a Dormitorio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Simple "Clase que representa un dormitorio simple"
    (is-a Dormitorio)
    (role concrete)
    (pattern-match reactive)
)

(defclass Peticion "Clase que representa la peticion"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; altura del piso
    (slot altura
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene aire acondicionado
    (slot has_aire
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene balcon
    (slot has_balcon
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene calefaccion
    (slot has_calefaccion
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene terraza
    (slot has_terraza
        (type SYMBOL)
        (create-accessor read-write))
    ;;; metros cuadrados habitables de la vivienda
    (slot m2_habitable
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica si el dormitortio tiene un armario empotrado
    (slot armario_empotrado
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene electrodomesticos instalados
    (slot electrodomesticos
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si el gas de la vivienda es butano o natural
    (slot gas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene ascensor
    (slot has_ascensor
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si, en caso de que la vivienda sea unifamiliar, si tiene garaje
    (slot has_garaje
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si, en caso de que la vivienda sea duplex o piso, tiene un parking
    (slot has_parking
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene piscina
    (slot has_piscina
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene vistas
    (slot has_vistas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda permite o no tener mascotas
    (slot mascotas
        (type SYMBOL)
        (create-accessor read-write))
    ;;; precio maximo dispuesto a pagar por una vivienda
    (slot max_precio
        (type INTEGER)
        (create-accessor read-write))
    ;;; precio minimo dispuesto a pagar por una vivienda
    (slot min_precio
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica si la vivienda est amueblada
    (slot muebles
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica el numero de banyeras que tiene el banyo
    (slot num_banyeras
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica el numero de dormitorios dobles que tiene la vivienda
    (slot num_dormD
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica el numero de dormitorios simples de la vivienda
    (slot num_dormS
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica el numero de duchas que tiene el banyo
    (slot num_duchas
        (type INTEGER)
        (create-accessor read-write))
    ;;; indica el momento que la vivienda esta soleado
    (slot soleado
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Indiferente "Peticiones indiferentes"
    (is-a Peticion)
    (role concrete)
    (pattern-match reactive)
)

(defclass Prefererida "Peticion preferente"
    (is-a Peticion)
    (role concrete)
    (pattern-match reactive)
)

(defclass Restrictiva "Peticiones restrictivas"
    (is-a Peticion)
    (role concrete)
    (pattern-match reactive)
)

(defclass Banyo "Clase que representa un banyo"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; indica si el banyo tiene banyera
    (slot has_banyera
        (type SYMBOL)
        (create-accessor read-write))
    ;;; indica si la vivienda tiene ducha
    (slot has_ducha
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Cliente "Clase que representa un cliente"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; el cliente obtiene recomendaciones
    (multislot obtiene_recomendaciones
        (type INSTANCE)
        (create-accessor read-write))
    ;;; cliente solicita peticiones
    (slot solicita_peticion
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Recomendacion "Clase que representa la recomendacion"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)
