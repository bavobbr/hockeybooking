package hockeybooking

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils

import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId

@Transactional
class ReservationService {

    SpringSecurityService securityService

    BookingResult book(Integer playerId, Integer trainingId, boolean present) {
        def player = Player.get(playerId)
        def training = Training.get(trainingId)
        log.info("Booking player $player for $training $present")
        if (training.date.before(new Date()) && !SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")) {
            return new BookingResult(success: false, message: "Can not edit dates that are passed.")
        }
        if (!present) {
            training.removeFromRegisteredPlayers(player)
            return new BookingResult(success: true, message: "Reservation deleted")
        }
        else {
            if (training.registeredPlayers.size() < training.maxPlayers) {
                training.addToRegisteredPlayers(player)
                return new BookingResult(success: true, message: "Reservation added for ${player.name}.")
            }
            else {
                training.addToRegisteredPlayers(player)
                return new BookingResult(success: true, message: "Booked a spot, but beware the limit has been reached and needs review!")
            }
        }
    }

    boolean assist(String fieldAssistant, String hygienicAssistant, String terrainAssistant, boolean reviewed, Integer trainingId) {
        def training = Training.get(trainingId)
        if (training.date.before(new Date()) && !SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")) {
            return false
        }
        training.terrainAssistant = terrainAssistant
        training.fieldAssistant = fieldAssistant
        training.hygienicAssistant = hygienicAssistant
        training.reviewed = reviewed
    }

    List<Training> findTrainingsByTeam(String name) {
        def today = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant())
        if (name) {
            def team = Team.findByName(name)
            return Training.findAllByTeamAndDateGreaterThanEquals(team, today)
        }
        else {
            return Training.findAllByDateGreaterThanEquals(today)
        }
    }

    List<Training> findPastTrainingsByTeam(String name) {
        def today = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant())
        if (name) {
            def team = Team.findByName(name)
            return Training.findAllByTeamAndDateLessThan(team, today)
        }
        else {
            return Training.findAllByDateLessThan(today)
        }
    }

    Training copyTraining(Training training) {
        def date = training.date
        def localDate = Instant.ofEpochMilli(date.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate()
        def shiftedDate = Date.from(localDate.plusDays(7).atStartOfDay(ZoneId.systemDefault()).toInstant())
        def nextTraining = new Training(date: shiftedDate, team: training.team, maxPlayers: training.maxPlayers)
        return nextTraining.save()
    }
}
