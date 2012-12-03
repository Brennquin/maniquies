package com.rubi.maniquies

class Cliente {
    String nombre

    static constraints = {
        nombre blank: false
    }
  
    String toString(){
        return nombre
    }
}
