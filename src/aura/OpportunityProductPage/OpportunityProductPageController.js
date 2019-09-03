({
    initCheckboxFilters: function (cmp) {
        var getProductFilters = cmp.get("c.getProductFilters");

        getProductFilters.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.filtersInfos", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(getProductFilters);
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