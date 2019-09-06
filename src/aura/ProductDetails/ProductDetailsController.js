({
    openModel: function (cmp, evt) {
        var eventOpportunityId = evt.getParam("opportunityId");
        var eventProduct2Id = evt.getParam("product2Id");

        if (eventOpportunityId === cmp.get("v.opportunityId")
            && eventProduct2Id === cmp.get("v.product2Id")) {

            cmp.set("v.isModalOpen", true);
        }
    },

    closeModel: function (cmp, evt) {
        cmp.set("v.isModalOpen", false);
    },

    initDetails: function (cmp, evt) {
        var product2Id = cmp.get('v.product2Id');

        var detailsAction = cmp.get("c.getDetails");
        detailsAction.setParams({
            "product2Id": product2Id
        });

        detailsAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.details", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(detailsAction);
    }
});