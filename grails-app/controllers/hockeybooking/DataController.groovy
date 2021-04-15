package hockeybooking

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class DataController {

    DataService dataService

    def prepare() {
        [imported: []]
    }

    def render() {
        [trainingList: Training.list()]
    }

    def load(String data) {
        log.info("Received:\n$data")
        def imported = dataService.importCsv(data)
        render(view: 'prepare', model: [imported: imported])
    }
}
