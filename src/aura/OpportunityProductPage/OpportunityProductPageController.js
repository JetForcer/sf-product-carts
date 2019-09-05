({
    initCheckboxFilters: function (cmp) {
        var opportunityId = cmp.get('v.recordId');

        var familiesOptionsAction = cmp.get("c.getFamiliesOptions");
        familiesOptionsAction.setParams({
            "opportunityId": opportunityId
        });

        familiesOptionsAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.familiesOptions", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(familiesOptionsAction);
    },

    handleSearchTextChange: function (cmp, evt, helper) {
        var enterKey = evt.code === "Enter";
        if (enterKey) {
            helper.doReloadFilteredProducts(cmp, evt)
        }
    },

    handleCheckboxFiltersChange: function (cmp, evt, helper) {
        helper.doReloadFilteredProducts(cmp, evt)
    },

    reloadFilteredProducts: function (cmp, evt, helper) {
        helper.doReloadFilteredProducts(cmp, evt)
    }
});