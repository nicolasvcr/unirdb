unirdb <- function(x,y) {
    if (identical(names(x), names(y))) {
        rbind(x, y)
    } else if (all(names(x) %in% names(y)) & all(names(y) %in% names(x))){
        print(" Los archivos tienen las mismas columnas, pero en distinto orden")
        continuar <- TRUE
        resp <- readline(prompt=" ¿Reordenar columnas? (s/n) ")
        while (continuar){
        if (resp == "s") {
            return(unirdb(x,y[names(x)]))
            continuar <- FALSE
        } else if (resp == "n") {
            stop("No se modificaron los archivos")
        } else {
            resp <- readline(prompt=" Responda sí (s) o no (n) ")
            continuar <- TRUE
        }
    }
    } else {
        stop(" Los archivos no tienen las mismas columnas")
    }
}
