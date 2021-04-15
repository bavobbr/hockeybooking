package admin

import grails.plugin.springsecurity.annotation.Secured
import hockeybooking.Team

@Secured('ROLE_ADMIN')
class TeamController {

    static scaffold = Team

}
