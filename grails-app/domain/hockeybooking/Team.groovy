package hockeybooking

import grails.rest.Resource

//@Resource(namespace = "rest")
class Team {

    String name
    String defaultDay
    Boolean optIn = false

    static hasMany = [players: Player, trainings: Training, trainers: Trainer]

    static constraints = {
        name maxSize: 100
        optIn nullable: false
        defaultDay nullable: true
    }

    String toString() {
        return name
    }
}
