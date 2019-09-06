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
    }
});