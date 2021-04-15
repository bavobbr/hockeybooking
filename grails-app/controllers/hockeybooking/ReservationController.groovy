package hockeybooking

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.http.HttpStatus

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ReservationController {

    ReservationService reservationService

    def index() {
        def team = params["team"] as String
        def trainings = reservationService.findTrainingsByTeam(team)
        def pastTrainings = reservationService.findPastTrainingsByTeam(team)
        def teamnames = Team.list().name
        [trainings: trainings.sort { it.date}, pastTrainings: pastTrainings, teamnames: teamnames.sort()]
    }

    def schedule(Team team) {
        def trainings = Training.findAllByTeam(team)
        def teamnames = Team.list().name
        [trainings: trainings.sort { it.date}, teamnames: teamnames.sort(), team:team]
    }

    def reserve(Training training) {
        def team = training.team
        def players = team.players
        [players: players.sort { it.name}, team: team, training: training]
    }

    def view(Player player) {
        [player: player]
    }

    def assist() {
        def trainingid = params.int("trainingid")
        def fieldAssistant = params["fa"] as String
        def hygienicAssistant = params["ha"] as String
        def terrainAssistant = params["ta"] as String
        def reviewed = params.boolean("reviewed")
        reservationService.assist(fieldAssistant, hygienicAssistant, terrainAssistant, reviewed, trainingid)
        redirect(controller: 'reservation', action: 'reserve', params: [id: trainingid])
    }

    def bookPlayer() {
        log.info("Booking player ...")
        def playerid = params.int("playerid")
        def present = params.boolean("present")
        def trainingId = params.int("trainingid")
        def result = reservationService.book(playerid, trainingId, present)
        response.status = result.success? HttpStatus.OK.value() : HttpStatus.NOT_ACCEPTABLE.value()
        render(result as JSON)
    }

    @Secured(['ROLE_ADMIN'])
    def copyTraining(Training training) {
        def nextTraining = reservationService.copyTraining(training)
        redirect(controller: 'reservation', action: 'reserve', params: [id: nextTraining.id])
    }
}
