package hockeybooking

import grails.rest.Resource

//@Resource(namespace = "rest")
class Player {

    String name
    String email
    String responsible
    Team team
    Date birthdate

    static belongsTo = [Training]
    static hasMany = [trainings: Training]

    static constraints = {
        name maxSize: 100
        team nullable: false
        email maxSize: 100, nullable: true
        responsible nullable: true
        trainings display: false
        birthdate nullable: true
    }

    String toString() {
        return name
    }
}
