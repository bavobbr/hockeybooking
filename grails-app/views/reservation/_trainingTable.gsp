<table class="table">
    <thead>
    <tr>
        <th>Team</th>
        <th>Date</th>
        <th>Reviewed</th>
        <th>#</th>
        <th><i class="fa fa-hand-paper-o"></i></th>
        <th><i class="fa fa-female"></i></th>
        <th><i class="fa fa-user-circle-o"></i></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${trainings}" var="training" status="idx">
        <tr>
            <td>${training.team.name}</td>
            <td><g:link controller="reservation" action="reserve" params="[id: training.id]">
                <g:formatDate date="${training.date}" format="dd/MM/yyyy hh:mm"/>
            </g:link></td>

            <td>
                <g:if test="${training.reviewed}">
                    <i class="fa fa-check-circle csstooltip fabig">
                    </i>
                </g:if>
                <g:else>
                    <i class="fa fa-exclamation-triangle fabig">
                    </i>
                </g:else>
            </td>

            <td>${training.registeredPlayers.size()} / ${training.maxPlayers}</td>
            <td>
                <g:if test="${training.fieldAssistant}">
                    <i class="fa fa-check-circle csstooltip fabig">
                        <span class="csstooltiptext">${training.fieldAssistant}</span>
                    </i>
                </g:if>
                <g:else>
                </g:else>
            </td>
            <td>
                <g:if test="${training.hygienicAssistant}">
                    <i class="fa fa-check-circle csstooltip fabig">
                        <span class="csstooltiptext">${training.hygienicAssistant}</span>
                    </i>
                </g:if>
                <g:else>

                </g:else>
            </td>
            <td>
                <g:if test="${training.terrainAssistant}">
                    <i class="fa fa-check-circle csstooltip fabig">
                        <span class="csstooltiptext">${training.terrainAssistant}</span>
                    </i>
                </g:if>
                <g:else>
                </g:else>
            </td></tr>
    </g:each>
    </tbody>
</table>