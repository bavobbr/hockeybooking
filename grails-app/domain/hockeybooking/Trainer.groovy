package hockeybooking

import grails.rest.Resource

//@Resource(namespace = "rest")
class Trainer {

    String name
    String email

    static hasMany = [team: Team]
    static belongsTo = [Team]

    static constraints = {
        name nullable: false
        email nullable: true
        team display: false
    }

    String toString() {
        return name
    }
}
