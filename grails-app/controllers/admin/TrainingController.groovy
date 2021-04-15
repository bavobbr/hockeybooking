package admin

import grails.plugin.springsecurity.annotation.Secured
import hockeybooking.Training

@Secured('ROLE_ADMIN')
class TrainingController {

    static scaffold = Training

}
